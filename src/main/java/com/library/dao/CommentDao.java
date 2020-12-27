package com.library.dao;

import com.library.bean.Comment;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class CommentDao {

    private final static String NAMESPACE = "com.library.dao.CommentDao.";
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public ArrayList<Comment> getAllComments() {
        List<Comment> result = sqlSessionTemplate.selectList(NAMESPACE + "getAllComments");
        return (ArrayList<Comment>) result;
    }

    public int addComment(final Comment comment) {
        return sqlSessionTemplate.insert(NAMESPACE + "addComment", comment);
    }

    public ArrayList<Comment> getComment(final long bookId) {
        List<Comment> comments = sqlSessionTemplate.selectList(NAMESPACE + "getComment", bookId);
        return (ArrayList<Comment>) comments;
    }

    public int deleteComment(final long id) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteComment", id);
    }
}
