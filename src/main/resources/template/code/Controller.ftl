package ${package}.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import ${package}.model.${model};
import ${package}.service.${model}Service;

@Controller
@RequestMapping("${model?lower_case}")
public class ${model}Controller extends BaseController {

    private final ${model}Service ${model?lower_case}Service;

    @Autowired
    public ${model}Controller(${model}Service ${model?lower_case}Service) {
        this.${model?lower_case}Service = ${model?lower_case}Service;
    }

    @RequestMapping("create")
    private String create(${model} ${model?lower_case}) {
        ${model?lower_case}Service.add(${model?lower_case});
        return "redirect:/${model?lower_case}/queryAll";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") ${PK} id) {
        ${model?lower_case}Service.remove(id);
        return "redirect:/${model?lower_case}/queryAll";
    }

    @RequestMapping("modify")
    private String modify(${model} ${model?lower_case}) {
        ${model?lower_case}Service.modify(${model?lower_case});
        return "redirect:/${model?lower_case}/queryAll";
    }

    @RequestMapping("queryAll")
    private String queryAll() {
        session.setAttribute("list", ${model?lower_case}Service.queryAll());
        return "redirect:/${model?lower_case}/list.jsp";
    }

     @RequestMapping("queryAll/{currentPage}")
    private String queryAll(@PathVariable int currentPage) {
        session.setAttribute("pagination", ${model?lower_case}Service.queryAll(currentPage));
        return "redirect:/${model?lower_case}/list.jsp";
    }
     @RequestMapping("queryAllPages")
    private String queryAllPages() {
        return queryAll(1);
    }

    @RequestMapping("queryById/{id}")
    private String queryById(@PathVariable("id") ${PK} id) {
        session.setAttribute("${model?lower_case}", ${model?lower_case}Service.queryById(id));
        return "redirect:/${model?lower_case}/edit.jsp";
    }
}