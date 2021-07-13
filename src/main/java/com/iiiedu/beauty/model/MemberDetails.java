package com.iiiedu.beauty.model;

import javax.persistence.*;

@Entity
public class MemberDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberDetailsPkId;

	@Column(nullable = false)
	private String emergencyContact;

	@Column(nullable = false,length = 10)
	private String emergencyNumber;

	@Column(nullable = false,length = 5)
	private String emergencyRelationship;

	@Column(nullable = false,length = 5)
	private String smoke;

	@Column(nullable = false,length = 5)
	private String betelNut;

	@Column(nullable = false)
	private String diseases;

	@Column(nullable = false)
	private String allergy;

	@Column(nullable = false)
	private String surgery;

	@OneToOne(mappedBy = "memberDetails")
	private Member member;
	
	public MemberDetails() {
		super();
	}

	public Integer getMemberDetailsPkId() {
		return memberDetailsPkId;
	}

	public void setMemberDetailsPkId(Integer memberDetailsPkId) {
		this.memberDetailsPkId = memberDetailsPkId;
	}

	public String getEmergencyContact() {
		return emergencyContact;
	}

	public void setEmergencyContact(String emergencyContact) {
		this.emergencyContact = emergencyContact;
	}

	public String getEmergencyNumber() {
		return emergencyNumber;
	}

	public void setEmergencyNumber(String emergencyNumber) {
		this.emergencyNumber = emergencyNumber;
	}

	public String getEmergencyRelationship() {
		return emergencyRelationship;
	}

	public void setEmergencyRelationship(String emergencyRelationship) {
		this.emergencyRelationship = emergencyRelationship;
	}

	public String getSmoke() {
		return smoke;
	}

	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}

	public String getBetelNut() {
		return betelNut;
	}

	public void setBetelNut(String betelNut) {
		this.betelNut = betelNut;
	}

	public String getDiseases() {
		return diseases;
	}

	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public String getSurgery() {
		return surgery;
	}

	public void setSurgery(String surgery) {
		this.surgery = surgery;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberDetails [memberDetailsPkId=");
		builder.append(memberDetailsPkId);
		builder.append(", emergencyContact=");
		builder.append(emergencyContact);
		builder.append(", emergencyNumber=");
		builder.append(emergencyNumber);
		builder.append(", emergencyRelationship=");
		builder.append(emergencyRelationship);
		builder.append(", smoke=");
		builder.append(smoke);
		builder.append(", betelNut=");
		builder.append(betelNut);
		builder.append(", diseases=");
		builder.append(diseases);
		builder.append(", allergy=");
		builder.append(allergy);
		builder.append(", surgery=");
		builder.append(surgery);
		builder.append(", member=");
		builder.append(member);
		builder.append("]");
		return builder.toString();
	}
	
	
}
