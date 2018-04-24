package com.psh.pattern.service;

import com.psh.pattern.domain.Sample;
import com.psh.pattern.repository.PatternMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Service
@Transactional
public class PatternService {

    @Autowired
    PatternMapper patternMapper;

    @Autowired
    RestTemplate restTemplate;
    
    public List<Sample> findAll() {
        return patternMapper.findAll();
    }

    public Sample findById(Long id) {
        return patternMapper.findById(id);
    }

    public void update(Sample sample) {
        patternMapper.update(sample);
    }

    public void delete(Sample sample) {
        patternMapper.delete(sample);
    }

    public String test() {

        String str = restTemplate.getForObject("https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=BTC,USD,EUR", String.class);
        return str;
    }

}