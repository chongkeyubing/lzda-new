package com.mwkj.lzda.core.shiro;

import java.util.HashSet;
import java.util.List;

import com.mwkj.lzda.constant.SystemConstant;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;


/**
 * Realm：域，shiro从Realm 获取安全数据（如用户、角色、权限），就是说SecurityManager
 * 要验证用户身份，那么它需要从 Realm 获取相应的用户进行比较以确定用户身份是否合法；
 * 也需要从Realm得到用户相应的角色/权限进行验证用户是否能进行操作；可以把 Realm 看
 * 成DataSource，即安全信息数据源
 */
public class UserRealm extends AuthorizingRealm{

	@Autowired
	private UserService userService;

	/**
	 * 获取身份验证信息，即数据库的包括账号密码的用户信息
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) {
		// 在登录之后，将账号密码填充到AuthenticationToken的子类UsernamePasswordToken中
		// 用UsernamePasswordToken中的账号密码和AuthenticationInfo中的账号密码进行比对

        // UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        // String username = usernamePasswordToken.getUsername();

		String policeCode = (String) token.getPrincipal();
		User user =  userService.findBy("policeCode",policeCode);

		if (ObjectUtils.isEmpty(user)) {
			throw new AuthenticationException();
		}

		//根据id获取盐值
		ByteSource salt = ByteSource.Util.bytes(SystemConstant.SALT);

		AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
				user.getPoliceCode(), user.getPassword(), salt,getName());
		return authenticationInfo;
	}

	/**
	 * 获取授权信息
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// 获取认证信息后，PrincipalCollection包含了身份信息
        // shiro中可以配置多个Realm，因此身份信息可能有多个，该类聚合了这些身份信息
        // 如果只有一个Principal则直接返回
		String username = (String) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

		//将授权信息组装到authorizationInfo
		List<String> roles= userService.getRoles(username);
		authorizationInfo.setRoles(new HashSet<>(roles));
		List<String> permissions= userService.getPermissions(username);
		authorizationInfo.setStringPermissions(new HashSet<>(permissions));

		return authorizationInfo;
	}
}
