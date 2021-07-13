package com.iiiedu.beauty.member.repository;

import com.iiiedu.beauty.model.MemberDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

public interface MemberDetailsRepository extends JpaRepository <MemberDetails , Integer> {

    @Modifying
    @Transactional
    @Query("UPDATE MemberDetails m set m.emergencyContact =?1,m.emergencyNumber =?2,m.emergencyRelationship = ?3,m.smoke = ?4,m.betelNut =?5,m.allergy =?6,m.surgery =?7,m.diseases =?8 where m.memberDetailsPkId = ?9")
    Integer saveProfile(String emergencyContact,String emergencyNumber,String emergencyRelationship,String smoke,String betelNut,String allergy,String surgery,String diseases, Integer memberDetailsPkId);

}
