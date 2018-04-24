package com.psh.pattern.repository;

import com.psh.pattern.domain.Sample;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface PatternMapper {

    public List<Sample> findAll();

    public Sample findById(Long id);

    public void create(Sample user);

    public void update(Sample user);

    public void delete(Sample user);
}