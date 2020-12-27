package com.library.service;

import com.library.bean.Book;
import com.library.bean.Comment;
import com.library.dao.BookDao;
import com.library.dao.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CommentService {
    @Autowired
    private CommentDao commentDao;

    public ArrayList<Comment> getAllBooks() {
        return commentDao.getAllComments();
    }

    public boolean addComment(Comment comment) {
        return commentDao.addComment(comment) > 0;
    }

    public ArrayList<Comment> getComment(Long bookId) {
        return commentDao.getComment(bookId);
    }

    public boolean deleteComment(Long id) {
        return commentDao.deleteComment(id) > 0;
    }
}
