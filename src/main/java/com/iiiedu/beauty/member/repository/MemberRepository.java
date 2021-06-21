package com.iiiedu.beauty.member.repository;


import com.iiiedu.beauty.model.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberRepository extends JpaRepository <Member,Integer> {

    @Query("SELECT u FROM Member u WHERE u.memberAccount = ?1")
    public Member findByMemberAccount(String memberAccount);

    @Query("SELECT u FROM Member u WHERE u.verificationCode = ?1")
    public Member findByVerificationCode(String code);

}
