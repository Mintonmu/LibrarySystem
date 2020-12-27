package com.library.controller;

import com.library.bean.Book;
import com.library.bean.Comment;
import com.library.bean.Lend;
import com.library.bean.ReaderCard;
import com.library.service.BookService;
import com.library.service.CommentService;
import com.library.service.LendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;

    @ResponseBody
    @RequestMapping("/comment_add_do")
    public String addBookDo(Comment comment, RedirectAttributes redirectAttributes) {
        comment.setTime(new Date());
        System.out.println(comment);
        if (commentService.addComment(comment)) {
            redirectAttributes.addFlashAttribute("succ", "评论发布成功！");
        } else {
            redirectAttributes.addFlashAttribute("succ", "评论发布失败！");
        }
        return "success";
    }
}
