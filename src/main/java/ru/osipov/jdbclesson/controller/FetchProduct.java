package ru.osipov.jdbclesson.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.osipov.jdbclesson.dao.ExecScript;

import java.util.List;

@RestController
public class FetchProduct {

    final ExecScript dao;

    public FetchProduct(ExecScript dao) {
        this.dao = dao;
    }

    @GetMapping("products/fetch-product")
    public List<String> getSQL(@RequestParam String name) {
        return dao.getProductName(name);
    }
}