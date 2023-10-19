package com.naver.myhome.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Company;
import com.naver.myhome.mybatis.mapper.CompanyMapper;

@Service
public class CompanyServiceImpl implements CompanyService{

	private CompanyMapper dao;

	@Autowired
	public CompanyServiceImpl(CompanyMapper dao) {
		this.dao = dao;
	}

	
	@Override
	public Company selectByDomain(String companyDomain) {
		return dao.selectByDomain(companyDomain);
	}


	@Override
	public int insert(Company company) {
		return dao.insert(company);
		
	}


	@Override
	public Company selectByEmail(String email) {
		// TODO Auto-generated method stub
		return dao.selectByMail(email);
	}
}
