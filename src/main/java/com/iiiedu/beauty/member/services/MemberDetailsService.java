package com.iiiedu.beauty.member.services;

import com.iiiedu.beauty.member.repository.MemberDetailsRepository;
import com.iiiedu.beauty.model.MemberDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MemberDetailsService {

    @Autowired
    private MemberDetailsRepository memberDetailsRepository;

    public List <MemberDetails> listAll(){
        return memberDetailsRepository.findAll();
    }

    public void save(MemberDetails memberDetails){
        memberDetailsRepository.save(memberDetails);
    }

    public MemberDetails get(Integer memberDetailsPkId){
        return memberDetailsRepository.findById(memberDetailsPkId).get();
    }

//    public void delete(Integer memberDetailsPkId){
//        memberDetailsRepository.deleteById(memberDetailsPkId);
//    }

}
