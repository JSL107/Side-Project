package com.hdsm.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.ChatbotStyleVO;
import com.hdsm.domain.Criteria;
import com.hdsm.domain.FilterDTO;
import com.hdsm.domain.ProductColorVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;
import com.hdsm.domain.ThumbnailVO;
import com.hdsm.persistence.ProductMapper;
import com.hdsm.util.ProductUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	// 스프링 4.3 이상부터 autowire 안해도 자동 처리 된대
	@Autowired
	private ProductMapper mapper;

	
	public List<ProductVO> getList(ProductVO product) {
		return mapper.getList(product);
	}

	@Override
	public List<ThumbnailVO> getProductThumbnailListWithPaging(ProductVO vo, Criteria cri, FilterDTO fd) {
		
		List<ProductVO> Productlist = mapper.getListWithPaging(vo, cri, fd);
		List<String> productIDs = new ArrayList<String>();
		//실제로 담을 List
		List<ThumbnailVO> Thumbnails = new ArrayList<ThumbnailVO>();

		Productlist.forEach(product -> {
			//ProductList에 들어있는 "ProductVO"객체의 pid를 따로 productIDs에 저장. 이는 Color 이미지들을 가져올때 씀
			productIDs.add(product.getPid());
			//ProductList에 들어있는 "ThumbnailVO"객체에 있는 colorThumbNail 속성을 채워주자 
			ThumbnailVO tn = new ThumbnailVO();
			tn.setPid(product.getPid());
			tn.setBname(product.getBname());
			tn.setPname(product.getPname());
			tn.setPprice(product.getPprice());			
			//size를 String -> 배열 -> List로
			if (product.getP_size() != null) {
				List<String> psizes = Arrays.asList(
						ProductUtil.builder().build().getSizeList(product.getP_size()));
				tn.setP_size(psizes);
			}
			tn.setColorList(new ArrayList<ThumbnailColorVO>());
			Thumbnails.add(tn);
		});
		
		
		//카테고리, 필터에대한 제품 리스트가 없는경우에는 컬러 탐색을 안해야지
		if(Productlist.size()>0) {
			List<ThumbnailColorVO> colorlist = mapper.getColorList(productIDs);
			//너무 찝찝한데 이중포문... Mapper에서 Map으로 return받으면 골치아파진다는데 일단 for문으로 할까 ..	
			for ( ThumbnailColorVO cvo : colorlist){
				for ( ThumbnailVO pvo : Thumbnails){
					if( pvo.getPid().equals(cvo.getProduct_pid())) {
						pvo.getColorList().add(cvo);
					}
				}//end for
			}//end for
		}

		for ( ThumbnailVO i : Thumbnails){
			log.info(i);
		}//end for
		
		return Thumbnails;
	}

	@Override
		public List<ThumbnailVO> getSearchThumbnailList(String words, Criteria cri, FilterDTO fd) {
		// TODO Auto-generated method stub
		log.info("service words : " + words);
		List<ProductVO> Productlist = mapper.getSearchList(words, cri, fd);
		List<String> productIDs = new ArrayList<String>();
		
		//실제로 담을 List
		List<ThumbnailVO> Thumbnails = new ArrayList<ThumbnailVO>();

		Productlist.forEach(product -> {
			//ProductList에 들어있는 "ProductVO"객체의 pid를 따로 productIDs에 저장. 이는 Color 이미지들을 가져올때 씀
			productIDs.add(product.getPid());
			//ProductList에 들어있는 "ThumbnailVO"객체에 있는 colorThumbNail 속성을 채워주자
			ThumbnailVO tn = new ThumbnailVO();
			tn.setPid(product.getPid());
			tn.setBname(product.getBname());
			tn.setPname(product.getPname());
			tn.setPprice(product.getPprice());			
			//size를 String -> 배열 -> List로
			List<String> psizes = Arrays.asList(
					ProductUtil.builder().build().getSizeList(product.getP_size()));
			tn.setP_size(psizes);
			tn.setColorList(new ArrayList<ThumbnailColorVO>());
			Thumbnails.add(tn);
		});
		
		
		//카테고리, 필터에대한 제품 리스트가 없는경우에는 컬러 탐색을 안해야지
		if(Productlist.size()>0) {
			List<ThumbnailColorVO> colorlist = mapper.getColorList(productIDs);
			//너무 찝찝한데 이중포문... Mapper에서 Map으로 return받으면 골치아파진다는데 일단 for문으로 할까 ..	
			for ( ThumbnailColorVO cvo : colorlist){
				for ( ThumbnailVO pvo : Thumbnails){
					if( pvo.getPid().equals(cvo.getProduct_pid())) {
						pvo.getColorList().add(cvo);
					}
				}//end for
			}//end for
		}

		for ( ThumbnailVO i : Thumbnails){
			log.info(i);
		}//end for
		
		return Thumbnails;
	}
	
	@Override
	public int productCount(ProductVO vo) {
		return mapper.productCount(vo);
	}

	@Override
	public int productFiltedCount(ProductVO vo, FilterDTO fd) {
		return mapper.productFiltedCount(vo, fd);
	}

	@Override
	public int productSearchedCount(String words) {
		return mapper.productSearchedCount(words);
	}

	@Override
	public int productSearchedFilteredCount(String words, FilterDTO fd) {
		return mapper.productSearchedFilteredCount(words, fd);
	}
	
	@Override
	public ProductVO getProduct(String pid) {
		
		return mapper.getProduct(pid);
	}

	@Override
	public List<ProductColorVO>  getProductColor(String pid) {
		
		return mapper.getProductColor(pid);
	}

	// 스마트옷장
	@Override
	public int styleSearchedCount(String style) {
		return mapper.styleSearchedCount(style);
	}

	// 스타일 필터링
	@Override
	public int styleSearchedFilteredCount(String style, FilterDTO fd) {
		return mapper.styleSearchedFilteredCount(style, fd);
	}

	@Override
	public List<ThumbnailVO> getSearchThumbnailListStyle(String style, Criteria cri, FilterDTO fd) {
		// TODO Auto-generated method stub
		log.info("service style : " + style);
		List<ProductVO> Productlist = mapper.getSearchListStyle(style, cri, fd);
		List<String> productIDs = new ArrayList<String>();

		//실제로 담을 List
		List<ThumbnailVO> Thumbnails = new ArrayList<ThumbnailVO>();

		Productlist.forEach(product -> {
			//ProductList에 들어있는 "ProductVO"객체의 pid를 따로 productIDs에 저장. 이는 Color 이미지들을 가져올때 씀
			productIDs.add(product.getPid());
			//ProductList에 들어있는 "ThumbnailVO"객체에 있는 colorThumbNail 속성을 채워주자
			ThumbnailVO tn = new ThumbnailVO();
			tn.setPid(product.getPid());
			tn.setBname(product.getBname());
			tn.setPname(product.getPname());
			tn.setPprice(product.getPprice());
			//size를 String -> 배열 -> List로
			List<String> psizes = Arrays.asList(
					ProductUtil.builder().build().getSizeList(product.getP_size()));
			tn.setP_size(psizes);
			tn.setColorList(new ArrayList<ThumbnailColorVO>());
			Thumbnails.add(tn);
		});


		//카테고리, 필터에대한 제품 리스트가 없는경우에는 컬러 탐색을 안해야지
		if(Productlist.size()>0) {
			List<ThumbnailColorVO> colorlist = mapper.getColorList(productIDs);
			//너무 찝찝한데 이중포문... Mapper에서 Map으로 return받으면 골치아파진다는데 일단 for문으로 할까 ..
			for ( ThumbnailColorVO cvo : colorlist){
				for ( ThumbnailVO pvo : Thumbnails){
					if( pvo.getPid().equals(cvo.getProduct_pid())) {
						pvo.getColorList().add(cvo);
					}
				}//end for
			}//end for
		}

		for ( ThumbnailVO i : Thumbnails){
			log.info(i);
		}//end for

		return Thumbnails;
	}


	@Override
	public List<ChatbotStyleVO> getRandomStyleList(String style) {
		// TODO Auto-generated method stub
		return mapper.getRandomStyleList(style);
	}





}
