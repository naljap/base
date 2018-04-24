package com.psh.common.repository;

import com.psh.common.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserRepository extends JpaRepository<User, String> {
    @Query("SELECT x FROM User x ORDER BY x.name")
    List<User> findAllOrderByName();
}