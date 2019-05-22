package ssm.demo.controller;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;
import ssm.demo.model.Collocation;
import ssm.demo.model.User;
import ssm.demo.service.CollocationService;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CollocationController extends BaseController {

    private final CollocationService collocationService;

    @Autowired
    public CollocationController(CollocationService collocationService) {
        this.collocationService = collocationService;
    }

    @RequestMapping("create")
    private String create(Collocation collocation,
        @RequestParam MultipartFile coverPictureFile
    ) throws IOException {
        System.out.println(collocation);
        String coverPicture = System.nanoTime() + "." + FilenameUtils.getExtension(coverPictureFile.getOriginalFilename());
        collocation.setCoverPicture(coverPicture);

        String COVERPICTURE_PATH = "/coverPicture";
        String musicAvatarPath = application.getRealPath(COVERPICTURE_PATH);
        coverPictureFile.transferTo(new File(musicAvatarPath, coverPicture));

        User user = (User) session.getAttribute("user");
        Integer id = user.getId();
        collocation.setUserId(id);
        collocationService.create(collocation);
        return "redirect:/collocation/queryByUser.action";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        collocationService.remove(id);
        return "redirect:/collocation/queryByUser.action";
    }


    @RequestMapping(value ="/modify")
    @ResponseBody
    public Map<String, Object> modify(Collocation collocation) {
        Map<String, Object> data = new HashMap<>();
//        System.out.println(collocation);
        Collocation collocation1 = (Collocation) session.getAttribute("collocation");
        Integer lookData = collocation1.getLookData();
        collocation.setLookData(lookData);
        collocationService.modify(collocation);
        Collocation collocation2 = collocationService.queryById(collocation.getId());
        session.setAttribute("collocation",collocation2);
        data.put("result","更新成功");
        return data;
    }

    @RequestMapping("collocation/queryAll")
    private String queryAll() {
        session.setAttribute("collocations", collocationService.queryAll());
        return "redirect:/grid.jsp";
    }

     @RequestMapping("queryAll/{currentPage}")
    private String queryAll(@PathVariable int currentPage) {
        session.setAttribute("pagination", collocationService.queryAll(currentPage));
        return "redirect:/collocation/list.jsp";
    }

     @RequestMapping("collocation/queryAllPages")
     private String queryAllPages() {
        return queryAll(1);
    }

    @RequestMapping("collocation/queryOneById/{id}")
    private String queryOneById(@PathVariable("id") Integer id) {
        Collocation collocation = collocationService.queryById(id);
        collocation.setLookData(collocation.getLookData() + 1);
        collocationService.modify(collocation);
        session.removeAttribute("author");
        session.setAttribute("collocation", collocationService.queryById(id));
        return "redirect:/fullwidth.jsp";
    }

    @RequestMapping("collocation/UserQueryOneById/{id}")
    private String UserQueryOneById(@PathVariable("id") Integer id) {
        Collocation collocation = collocationService.queryById(id);
//        System.out.println("test lookData : "+collocation);
        collocation.setLookData(collocation.getLookData() + 1);
        collocationService.modify(collocation);
        session.setAttribute("author","author");
        session.setAttribute("collocation", collocationService.queryById(id));
        return "redirect:/fullwidth.jsp";
    }
    @RequestMapping("collocation/queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("collocation", collocationService.queryById(id));
        return "redirect:/collocation/edit.jsp";
    }

    @RequestMapping("collocation/queryByUser")
    private String queryByUser() {
        User user = (User) session.getAttribute("user");
        session.setAttribute("collocations", collocationService.queryByUser(user.getId()));
        return "redirect:/grid.jsp";
    }

    @RequestMapping(value ="/collocation/queryByKeyword")
    @ResponseBody
    public Map<Integer, Collocation> queryByKeyword(String keyword) {
        Map<Integer, Collocation> data = new HashMap<>();
//        System.out.println(keyword);
        User user = (User) session.getAttribute("user");
        Integer id = user.getId();
        List<Collocation> searchs = collocationService.queryByKeyword(keyword);
        for ( int i=0; i<searchs.size(); i++){
            data.put(searchs.get(i).getId(), searchs.get(i));
        }
        return data;
    }

    @RequestMapping(value ="collocation/queryByType/{id}")
    @ResponseBody
    public Map<Integer, Collocation> queryByType(@PathVariable("id") Integer id) {
        Map<Integer, Collocation> data = new HashMap<>();
        List<Collocation> typeCollocations = collocationService.queryByType(id);
        for ( int i=0; i<typeCollocations.size(); i++){
            data.put(typeCollocations.get(i).getId(), typeCollocations.get(i));
        }
        return data;
    }

    @RequestMapping(value ="collocation/queryByLookData")
    @ResponseBody
    public Map<Integer, Collocation> queryByLookData() {
        Map<Integer, Collocation> data = new HashMap<>();
        List<Collocation> typeCollocations = collocationService.queryByLookData();
        for ( int i=0; i<typeCollocations.size(); i++){
            data.put(i, typeCollocations.get(i));
        }
        return data;
    }

    @RequestMapping(value ="collocation/queryByCreateTime")
    @ResponseBody
    public Map<Integer, Collocation> queryByCreateTime() {
        Map<Integer, Collocation> data = new HashMap<>();
        List<Collocation> typeCollocations = collocationService.queryByCreateTime();
        for ( int i=0; i<typeCollocations.size(); i++){
            data.put(i, typeCollocations.get(i));
        }
        return data;
    }
}