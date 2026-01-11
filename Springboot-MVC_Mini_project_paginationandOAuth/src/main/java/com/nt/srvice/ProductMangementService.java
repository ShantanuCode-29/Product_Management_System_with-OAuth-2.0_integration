package com.nt.srvice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.nt.entity.Product;
import com.nt.repository.IProductRepo;
@Service
public class ProductMangementService implements IProductMangementService 
{
	@Autowired
private IProductRepo prodRepo;
	
	
	@Override
	public List<Product> showproduct() 
	{
		List<Product> prodlist = prodRepo.findAll();
		prodlist.stream().sorted();
		return prodlist;
	}
	@Override
	public String registerProduct(Product prod) 
	{
		Long id = prodRepo.save(prod).getId();
		return "Product is saved with id value::"+id;
	}
	@Override
	public Product getProductbyid(Integer id) {
		Product prod = prodRepo.findById(id).orElseThrow(()->new IllegalArgumentException("invalid id"));
		return prod;
	}
	@Override
	public String updateProduct(Product prod) {
		  Long id = prodRepo.save(prod).getId();
		return "Product is update with id ::"+id;
	}
	@Override
	public String deletebyId(Integer id) 
	{
		prodRepo.deleteById(id);
		return "Product of::"+ id+"::is deleted sucessfully";
	}
	@Override
	public Page<Product> showdatabyPage(Pageable pageable) {
		Page<Product> alldata = prodRepo.findAll(pageable);
		return alldata;
	}
	
	
	@Override
	public List<Product> showProductByExampleObj(Product product,
	        boolean ascOrder, String prop) {

	    Sort sort = Sort.by(ascOrder ? Direction.ASC : Direction.DESC, prop);

	    ExampleMatcher matcher = ExampleMatcher.matching()
	            .withIgnoreCase()
	            .withIgnoreNullValues()
	            .withStringMatcher(ExampleMatcher.StringMatcher.CONTAINING);

	    Example<Product> example = Example.of(product, matcher);

	    return prodRepo.findAll(example, sort);
	}



}
