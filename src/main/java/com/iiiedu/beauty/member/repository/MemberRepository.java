package com.iiiedu.beauty.member.repository;


import com.iiiedu.beauty.model.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;

public interface MemberRepository extends JpaRepository <Member,Integer> {

    @Query("SELECT m FROM Member m WHERE m.memberAccount = ?1")
    public Member findByMemberAccount(String memberAccount);

    @Query("SELECT m FROM Member m WHERE m.memberAccount = :memberAccount")
    public Member getMemberByMemberAccount(@Param("memberAccount")String memberAccount);

    @Query("SELECT m FROM Member m WHERE m.verificationCode = ?1")
    public Member findByVerificationCode(String code);

    @Modifying
    @Transactional
    @Query("UPDATE Member m set m.photos =?1 where m.memberPkId = ?2")
    Integer updatePhoto(String photos, Integer memberPkId);

    @Modifying
    @Transactional
    @Query("UPDATE Member m set m.memberName =?1,m.memberIdNumber =?2,m.memberLineId = ?3,m.memberPhone = ?4,m.memberAddress =?5 where m.memberPkId = ?6")
    Integer savebasic(String memberName,String memberIdNumber,String memberLineId,String memberPhone,String memberAddress, Integer memberPkId);

    public Member findByResetPasswordToken(String token);

}
