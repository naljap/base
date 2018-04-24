package com.psh.pattern.controller;

import com.psh.pattern.domain.Sample;
import com.psh.pattern.service.PatternService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class Pattern1Controller {

    private static final Logger logger = LoggerFactory.getLogger(Pattern1Controller.class);

    @Autowired
    PatternService patternService;
    
    @RequestMapping(value = "api/pattern1", method = RequestMethod.GET)
    List<Sample> getPatterns() {

        // [TASK] 로그 테스트
        logger.error("error : " + "getPatterns");
        logger.warn("warn : " + "getPatterns");
        logger.info("info : " + "getPatterns");
        logger.debug("debug : " + "getPatterns");

        List<Sample> pattern = patternService.findAll();
        return pattern;
    }

    @RequestMapping(value = "api/pattern1/{id}", method = RequestMethod.GET)
    Sample getPattern(@PathVariable Long id) {
        Sample pattern = patternService.findById(id);
        return pattern;
    }

    @RequestMapping(value = "api/pattern1/{id}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    void putPattern(@PathVariable Long id, @RequestBody Sample sample) {
        sample.setId(id);
        patternService.update(sample);
    }

    @RequestMapping(value = "api/pattern1/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    void deletePattern(@PathVariable Long id) {
        Sample sample = new Sample();
        sample.setId(id);
        patternService.delete(sample);
    }


    @RequestMapping(value = "api/pattern1-test", method = RequestMethod.GET)
    List<Sample> test() {
        String result = patternService.test();
        return null;
    }
}