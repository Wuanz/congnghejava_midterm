package tdt.edu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tdt.edu.model.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {

}
