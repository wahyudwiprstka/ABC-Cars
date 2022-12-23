package com.assessment.abc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.assessment.abc.entity.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
}
