package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.BillEntity;

@Repository
public interface BillRepository extends JpaRepository<BillEntity, Long> {
	List<BillEntity> findByStatus(Long status);
	@Query(value = "SELECT * FROM  bill  WHERE bill.status=?1 and year(bill.createddate)=?2"
			,nativeQuery = true)
	List<BillEntity> findByStatusAndDate(Long status, Long year);
	@Query(value = "SELECT * FROM  bill  WHERE bill.status=?1 and year(bill.createddate)=?2 "
			+ "and MONTH(bill.createddate)=?3",nativeQuery = true)
	List<BillEntity> findByStatusAndDate(Long status, Long year, Long month);
	@Query(value = "SELECT * FROM  bill  WHERE bill.status=?1 and year(bill.createddate)=?2 "
			+ "and MONTH(bill.createddate)=?3 and day(bill.createddate)=?4",nativeQuery = true)
	List<BillEntity> findByStatusAndDate(Long status, Long year, Long month, Long day);
	int countByCustomerId(Long id);
	
}
