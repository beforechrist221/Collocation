package ssm.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import ssm.demo.model.Type;
import ssm.demo.model.User;
import ssm.demo.service.TypeService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TypeController extends BaseController {

    private final TypeService typeService;

    @Autowired
    public TypeController(TypeService typeService) {
        this.typeService = typeService;
    }

    /*@RequestMapping("type/create")
    private String create(Type type) {
        typeService.add(type);
        return "redirect:/type/queryAllPages.action";
    }

    @RequestMapping("type/remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        typeService.remove(id);
        return "redirect:/type/queryAllPages.action";
    }

    @RequestMapping("type/modify")
    private String modify(Type type) {
        typeService.modify(type);
        return "redirect:/type/queryAllPages.action";
    }
*/
    @RequestMapping(value ="/queryAllTypes")
    @ResponseBody
    public Map<Integer, Object> queryAllTypes() {
        Map<Integer, Object> data = new HashMap<>();
//        System.out.println("12345");
        List<Type> types = typeService.queryAll();
//        System.out.println(types);
        for ( int i=0; i<types.size(); i++){
            data.put(types.get(i).getId(), types.get(i).getTypename());
        }
        session.setAttribute("types", types);
        return data;
    }

     /*@RequestMapping("type/queryAll/{currentPage}")
    private String queryAll(@PathVariable int currentPage) {
        session.setAttribute("pagination", typeService.queryAll(currentPage));
        return "redirect:/type/list.jsp";
    }
     @RequestMapping("type/queryAllPages")
    private String queryAllPages() {
        return queryAll(1);
    }

    @RequestMapping("type/queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("type", typeService.queryById(id));
        return "redirect:/type/edit.jsp";
    }*/
}