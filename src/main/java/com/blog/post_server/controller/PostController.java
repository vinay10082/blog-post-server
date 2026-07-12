package com.blog.post_server.controller;

import com.blog.post_server.model.Post;
import com.blog.post_server.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/posts")
@CrossOrigin(origins = "*") // Nginx handles CORS for production, this helps local testing
public class PostController {

    @Autowired
    private PostRepository postRepository;

    @GetMapping
    public List<Post> getAllPosts() {
        return postRepository.findAll();
    }

    @GetMapping("/{id}")
    public Post getPostById(@PathVariable Long id) {
        return postRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Post not found with id: " + id));
    }

    @PostMapping
    public Post createPost(@RequestBody Post post) {
        Long authorId = (Long) SecurityContextHolder.getContext().getAuthentication().getDetails();
        post.setAuthorId(authorId);
        return postRepository.save(post);
    }
}
