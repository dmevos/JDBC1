package ru.osipov.jdbclesson.dao;

import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
public class ExecScript {
    private final String mySql = read("script.sql");

    private final NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public ExecScript(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    public List<String> getProductName(String name) {
        Map<String, String> param = new HashMap<>();
        param.put("name", name);
        return namedParameterJdbcTemplate.query(
                mySql,
                param,
                (rs, rowNum) -> rs.getString("product_name")
        );
    }

    private static String read(String scriptFileName) {
        try (InputStream is = new ClassPathResource(scriptFileName).getInputStream();
             BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is))) {
            return bufferedReader.lines().collect(Collectors.joining("\n"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}