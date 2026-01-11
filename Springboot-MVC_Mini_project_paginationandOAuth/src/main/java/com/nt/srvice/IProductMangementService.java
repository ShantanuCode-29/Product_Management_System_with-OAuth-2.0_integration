package com.nt.srvice;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.nt.entity.Product;

public interface IProductMangementService 
{
public List<Product>showproduct();
public String registerProduct(Product prod);
public Product getProductbyid(Integer id);
public String updateProduct(Product prod);
public String deletebyId(Integer id);

//pageable method for pagination 
public Page<Product>showdatabyPage (Pageable pageable);

//method for search bar 
public List<Product>showProductByExampleObj(Product product,boolean ascOrder,String prop);

}
