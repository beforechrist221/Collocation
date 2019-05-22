package ssm.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import ssm.demo.model.User;
import ssm.demo.service.UserService;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController extends BaseController{

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value ="/reg")
    public String signUp(User user){
        userService.reg(user);
        return "redirect:/login.jsp";
    }

    @RequestMapping(value ="/login")
    public String signIn(User user){
//        System.out.println(user);
        user = userService.login(user);
        if (user != null) {
           session.setAttribute("user",user);
           return "redirect:/index.jsp";
        }
        request.setAttribute("message", "Invalid username or password");
        return "/login.jsp";
    }

    @RequestMapping(value ="/signOut")
    public String signOut(){
        session.invalidate();
        return "redirect:/index.jsp";
    }

    @RequestMapping(value ="/updateInfo")
    @ResponseBody
    public Map<String, Object> updateInfo(User user) {
        Map<String, Object> data = new HashMap<>();
        userService.updateInfo(user);
        User newUser = userService.queryUserById(user.getId());
        System.out.println(newUser);
        session.setAttribute("user",newUser);
        User user1 = userService.queryUserById(user.getId());
        session.setAttribute("user",user1);
        data.put("result","更新成功");
        return data;
    }

    @RequestMapping(value ="/resetAvatar")
    public String resetAvatar(@RequestParam MultipartFile avatarFile) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        Integer id = user.getId();

        String avatar = avatarFile.getOriginalFilename();

        String originName = avatarFile.getOriginalFilename();
        String extension = originName.substring(originName.lastIndexOf("."));
        String fileName = System.currentTimeMillis() + extension;
        avatar = fileName;

        String AVATAR_PATH = "/avatar";

        String avatarPath = application.getRealPath(AVATAR_PATH);
        avatarFile.transferTo(new File(avatarPath, avatar));

        user.setAvatar(avatar);
        userService.resetAvatar(user);
        User newUser = userService.queryUserById(user.getId());
        session.setAttribute("user",newUser);
        return "redirect:/information.jsp";
    }

    @RequestMapping(value ="/resetPassword")
    @ResponseBody
    public Map<String, Object> resetPassword(User user) {
        Map<String, Object> data = new HashMap<>();
        System.out.println(user);
        userService.resetPassword(user);
        User newUser = userService.queryUserById(user.getId());
        System.out.println(newUser);
        session.setAttribute("user",newUser);
        data.put("result","更新成功");
        return data;
    }
}
