package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.CustomerEntity;

@Repository
public interface CustomerRepository extends JpaRepository<CustomerEntity, Long> {
	List<CustomerEntity> findByStatus(Long status);
	@Query(value = "SELECT * FROM  customer  WHERE customer.status=?1 and year(customer.createddate)=?2"
			,nativeQuery = true)
	List<CustomerEntity> findByStatusAndDate(Long status, Long year);
	@Query(value = "SELECT * FROM  customer  WHERE customer.status=?1 and year(customer.createddate)=?2 "
			+ "and MONTH(customer.createddate)=?3",nativeQuery = true)
	List<CustomerEntity> findByStatusAndDate(Long status, Long year, Long month);
	@Query(value = "SELECT * FROM  customer  WHERE customer.status=?1 and year(customer.createddate)=?2 "
			+ "and MONTH(customer.createddate)=?3 and day(customer.createddate)=?4",nativeQuery = true)
	List<CustomerEntity> findByStatusAndDate(Long status, Long year, Long month, Long day);
	int countByStatus(Long status);
	int countByStatusAndSex(Long status, String sex);
	
}
