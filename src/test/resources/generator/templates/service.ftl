package ${basePackage}.service;
import ${basePackage}.model.${modelNameUpperCamel};
import ${basePackage}.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: ${date}
* @Description TODO
*/
public interface ${modelNameUpperCamel}Service extends Service<${modelNameUpperCamel}> {
    void add(${modelNameUpperCamel} ${modelNameLowerCamel}, Approve approve, HttpServletRequest request);
}
