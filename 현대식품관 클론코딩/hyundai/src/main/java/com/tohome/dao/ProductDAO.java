package com.tohome.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.tohome.dto.ProductDTO;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleType;
import oracle.jdbc.OracleTypes;
import util.JDBConnect;

public class ProductDAO extends JDBConnect{
   private ProductDAO() {
   }

   private static ProductDAO instance = new ProductDAO();

   public static ProductDAO getInstance() {
      return instance;
   }
   
   //Written  by 미림, 여명
   public ArrayList<ProductDTO> getAllProductList(int topnum, int filter) {
      ArrayList<ProductDTO> allProductList = new ArrayList<ProductDTO>(); //ProductList담을 그릇 준비
      String sql = "{call product_pkg.import_all_product_list(?,?,?)}"; // sql문 준비(미리 정의해놓은 패키지안의 프로시저에 선언한 인자만큼 ? 를 넣음)

      Connection conn = null;
      CallableStatement cstmt=null;
      ResultSet rs = null;

      try {
         conn = JDBConnect.getConnection();
         cstmt = conn.prepareCall(sql);
         cstmt.setInt(1, filter);//? 에 각각 맞는 값을 넣음
         cstmt.setInt(2, topnum);//? 에 각각 맞는 값을 넣음
           cstmt.registerOutParameter(3, OracleTypes.CURSOR);//? 에 각각 맞는 값을 넣음
         
           // CallableStatement를 실행
           cstmt.executeQuery();

           // getCursor() 메서드를 사용하기 위해 OracleCallableStatement Object로 변환
           // CallableStatement는 getCursor() 메서드가 정의되어 있지 않기 때문
           OracleCallableStatement ocstmt = (OracleCallableStatement)cstmt;
           // ResultSet에 결과 데이터를 담은 Cursor를 저장
           rs = ocstmt.getCursor(3);
             
         while (rs.next()) {
            ProductDTO product = new ProductDTO();// productDTO를 만들어놓고 아래는 값들은 전부 담음
            product.setProd_no(rs.getInt("prod_no"));
            product.setShop_name(rs.getString("shop_name"));
            product.setProd_name(rs.getString("prod_name"));
            product.setPrice(rs.getInt("price"));
            product.setProd_img(rs.getString("prod_img"));
            product.setCategory_id(rs.getInt("category_id"));
            product.setSubscribe_yn(rs.getString("subscribe_yn"));
            product.setPack_type(rs.getString("pack_type"));
            product.setProd_stock(rs.getString("prod_stock"));
            product.setCreat_date(rs.getString("creat_date"));
            allProductList.add(product);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         JDBConnect.close();
      }
      return allProductList;
   }
   
   //Written  by 여명, 승준
   public ArrayList<ProductDTO> getLatestProductList(int topnum) {
      ArrayList<ProductDTO> LatestProductList = new ArrayList<ProductDTO>(); //ProductList담을 그릇 준비
      String sql = "{call product_pkg.import_latest_product_list(?,?)}"; // sql문 준비(미리 정의해놓은 패키지안의 프로시저에 선언한 인자만큼 ? 를 넣음)

      Connection conn = null;
      CallableStatement cstmt=null;
      ResultSet rs = null;

      try {
         conn = JDBConnect.getConnection();
         cstmt = conn.prepareCall(sql);
         cstmt.setInt(1, topnum);//? 에 각각 맞는 값을 넣음
           cstmt.registerOutParameter(2, OracleTypes.CURSOR);//? 에 각각 맞는 값을 넣음
         
           // CallableStatement를 실행
           cstmt.executeQuery();

           // getCursor() 메서드를 사용하기 위해 OracleCallableStatement Object로 변환
           // CallableStatement는 getCursor() 메서드가 정의되어 있지 않기 때문
           OracleCallableStatement ocstmt = (OracleCallableStatement)cstmt;
           // ResultSet에 결과 데이터를 담은 Cursor를 저장
           rs = ocstmt.getCursor(2);
             
         while (rs.next()) {
            ProductDTO product = new ProductDTO();// productDTO를 만들어놓고 아래는 값들은 전부 담음
            product.setProd_no(rs.getInt("prod_no"));
            product.setShop_name(rs.getString("shop_name"));
            product.setProd_name(rs.getString("prod_name"));
            product.setPrice(rs.getInt("price"));
            product.setProd_img(rs.getString("prod_img"));
            product.setCategory_id(rs.getInt("category_id"));
            product.setSubscribe_yn(rs.getString("subscribe_yn"));
            product.setPack_type(rs.getString("pack_type"));
            product.setProd_stock(rs.getString("prod_stock"));
            product.setCreat_date(rs.getString("creat_date"));
            LatestProductList.add(product);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         JDBConnect.close();
      }
      return LatestProductList;
   }
   //Written  by 여명, 승준
   public ArrayList<ProductDTO> getCategoryProductList(int cid, int topnum, int filter) {
      ArrayList<ProductDTO> categoryProductList = new ArrayList<ProductDTO>();  //ProductList담을 그릇 준비
      String sql = "{call product_pkg.import_category_product_list(?,?,?,?)}"; // sql문 준비(미리 정의해놓은 패키지안의 프로시저에 선언한 인자만큼 ? 를 넣음)

      Connection conn = null;
      CallableStatement cstmt=null;
      ResultSet rs = null;

      try {
         conn = JDBConnect.getConnection();
         cstmt = conn.prepareCall(sql);
         cstmt.setInt(1, filter);//? 에 각각 맞는 값을 넣음
         cstmt.setInt(2, cid);//? 에 각각 맞는 값을 넣음
         cstmt.setInt(3, topnum);//? 에 각각 맞는 값을 넣음
         cstmt.registerOutParameter(4, OracleTypes.CURSOR);//? 에 in out모드로 테이블 커서를 반환받을 수 있게 커서 타입을 outParmeter로 등록
         
           // CallableStatement를 실행
           cstmt.executeQuery();

           // getCursor() 메서드를 사용하기 위해 OracleCallableStatement Object로 변환
           // CallableStatement는 getCursor() 메서드가 정의되어 있지 않기 때문
           OracleCallableStatement ocstmt = (OracleCallableStatement)cstmt;
           // ResultSet에 결과 데이터를 담은 Cursor를 저장
           rs = ocstmt.getCursor(4);
             
         while (rs.next()) {
            ProductDTO product = new ProductDTO();// productDTO를 만들어놓고 아래는 값들은 전부 담음
            product.setProd_no(rs.getInt("prod_no"));
            product.setShop_name(rs.getString("shop_name"));
            product.setProd_name(rs.getString("prod_name"));
            product.setPrice(rs.getInt("price"));
            product.setProd_img(rs.getString("prod_img"));
            product.setCategory_id(rs.getInt("category_id"));
            product.setSubscribe_yn(rs.getString("subscribe_yn"));
            product.setPack_type(rs.getString("pack_type"));
            product.setProd_stock(rs.getString("prod_stock"));
            product.setCreat_date(rs.getString("creat_date"));
            categoryProductList.add(product);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         JDBConnect.close();
      }
      return categoryProductList;
   }
   
   //Written  by 여명, 승준
   public ArrayList<ProductDTO> LatestProductList(int topnum, int filter) {

	      ArrayList<ProductDTO> latestProductList = new ArrayList<ProductDTO>();//ProductList담을 그릇 준비
	      String sql = "{call product_pkg.import_latest_product_list(?,?,?)}";// sql문 준비(미리 정의해놓은 패키지안의 프로시저에 선언한 인자만큼 ? 를 넣음)

	      Connection conn = null;
	      CallableStatement cstmt=null;
	      ResultSet rs = null;

	      try {
	         conn = JDBConnect.getConnection();
	         cstmt = conn.prepareCall(sql);
	         cstmt.setInt(1, filter);//? 에 각각 맞는 값을 넣음
	         cstmt.setInt(2, topnum);//? 에 각각 맞는 값을 넣음
	           cstmt.registerOutParameter(3, OracleTypes.CURSOR);//? 에 각각 맞는 값을 넣음
	         
	           // CallableStatement를 실행
	           cstmt.executeQuery();

	           // getCursor() 메서드를 사용하기 위해 OracleCallableStatement Object로 변환
	           // CallableStatement는 getCursor() 메서드가 정의되어 있지 않기 때문
	           OracleCallableStatement ocstmt = (OracleCallableStatement)cstmt;
	           // ResultSet에 결과 데이터를 담은 Cursor를 저장
	           rs = ocstmt.getCursor(3);
	         while (rs.next()) {
	            ProductDTO product = new ProductDTO();// productDTO를 만들어놓고 아래는 값들은 전부 담음
	            product.setProd_no(rs.getInt("prod_no"));
	            product.setShop_name(rs.getString("shop_name"));
	            product.setProd_name(rs.getString("prod_name"));
	            product.setPrice(rs.getInt("price"));
	            product.setProd_img(rs.getString("prod_img"));
	            product.setCategory_id(rs.getInt("category_id"));
	            product.setSubscribe_yn(rs.getString("subscribe_yn"));
	            product.setPack_type(rs.getString("pack_type"));
	            product.setProd_stock(rs.getString("prod_stock"));
	            product.setCreat_date(rs.getString("creat_date"));
	            latestProductList.add(product);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         JDBConnect.close();
	      }
	      return latestProductList;
	   }
   
   //Written  by 여명, 승준
   public ArrayList<ProductDTO> getLatestProductList(int cid, int topnum) {
      ArrayList<ProductDTO> latestProductList = new ArrayList<ProductDTO>();//ProductList담을 그릇 준비
      String sql = "{call product_pkg.import_category_latest_product_list(?,?,?)}";// sql문 준비(미리 정의해놓은 패키지안의 프로시저에 선언한 인자만큼 ? 를 넣음)

      Connection conn = null;
      CallableStatement cstmt=null;
      ResultSet rs = null;

      try {
         conn = JDBConnect.getConnection();
         cstmt = conn.prepareCall(sql);
         cstmt.setInt(1, cid);//? 에 각각 맞는 값을 넣음
         cstmt.setInt(2, topnum);//? 에 각각 맞는 값을 넣음
           cstmt.registerOutParameter(3, OracleTypes.CURSOR);//? 에 각각 맞는 값을 넣음
         
           // CallableStatement를 실행
           cstmt.executeQuery();

           // getCursor() 메서드를 사용하기 위해 OracleCallableStatement Object로 변환
           // CallableStatement는 getCursor() 메서드가 정의되어 있지 않기 때문
           OracleCallableStatement ocstmt = (OracleCallableStatement)cstmt;
           // ResultSet에 결과 데이터를 담은 Cursor를 저장
           rs = ocstmt.getCursor(3);
         while (rs.next()) {
            ProductDTO product = new ProductDTO();// productDTO를 만들어놓고 아래는 값들은 전부 담음
            product.setProd_no(rs.getInt("prod_no"));
            product.setShop_name(rs.getString("shop_name"));
            product.setProd_name(rs.getString("prod_name"));
            product.setPrice(rs.getInt("price"));
            product.setProd_img(rs.getString("prod_img"));
            product.setCategory_id(rs.getInt("category_id"));
            product.setSubscribe_yn(rs.getString("subscribe_yn"));
            product.setPack_type(rs.getString("pack_type"));
            product.setProd_stock(rs.getString("prod_stock"));
            product.setCreat_date(rs.getString("creat_date"));
            latestProductList.add(product);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         JDBConnect.close();
      }
      return latestProductList;
   }
   
   //Written  by 여명, 승준
   //차트부분에서 쓸라고 간단하게 preparedStatement로 만듬
   public  ArrayList<Integer> getProductCountforCategory() {
      ArrayList<Integer> toChartData = new ArrayList<Integer>();
      String sql = "select count(*) as sum from prod_detail group by CATEGORY_ID ";

      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
         con = JDBConnect.getConnection();
         pstmt = con.prepareStatement(sql);

         rs = pstmt.executeQuery();
         int i = 0;
         while (rs.next()) {
        	 toChartData.add(rs.getInt("sum"));
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         JDBConnect.close();
      }
      return toChartData;
   }
   
   //Written  by 여명, 승준 - 이부분은 사실상 안쓰는 부분 초반 테스트 용이였음
   public ProductDTO getProduct(int prod_no) {
      ProductDTO product = new ProductDTO();
      String sql = "select * from prod_detail where prod_no = ? ";

      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
         con = JDBConnect.getConnection();
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, prod_no);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            product.setProd_no(rs.getInt("prod_no"));
            product.setShop_name(rs.getString("shop_name"));
            product.setProd_name(rs.getString("prod_name"));
            product.setPrice(rs.getInt("price"));
            product.setProd_img(rs.getString("prod_img"));
            product.setCategory_id(rs.getInt("category_id"));
            product.setSubscribe_yn(rs.getString("subscribe_yn"));
            product.setPack_type(rs.getString("pack_type"));
            product.setProd_stock(rs.getString("prod_stock"));
            product.setCreat_date(rs.getString("creat_date"));
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         JDBConnect.close();
      }
      return product;
   }

   //이부분 시간부족으로 기능구현 못해서 쓰지않음
   public int insertProduct(ProductDTO product) {
      int result = 0;


//         
      String sql = "{call member_pkg.insert_basket_detail (?,?,?)}";
      Connection con = null;
      PreparedStatement pstmt = null;

      try {
         con = JDBConnect.getConnection();
         pstmt = con.prepareStatement(sql);
         pstmt = con.prepareCall(sql);
         pstmt.setInt(2, product.getProd_no());
         pstmt.setInt(2, product.getProd_no());
         pstmt.setInt(2, product.getProd_no());
         result = pstmt.executeUpdate();
      } catch (Exception e) {
         System.out.println("異붽   떎 뙣");
         e.printStackTrace();
      } finally {
         JDBConnect.close();
      }
      return result;
   }

   //이부분 시간부족으로 기능구현 못해서 쓰지않음
   public int updateProduct(ProductDTO product) {
      int result = -1;
      String sql = "update product set kind=?, useyn=?, name=?"
            + ", price1=?, price2=?, price3=?, content=?, image=?, bestyn=? " + "where pseq=?";

      Connection con = null;
      PreparedStatement pstmt = null;

      try {
         con = JDBConnect.getConnection();
         pstmt = con.prepareStatement(sql);
         result = pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         JDBConnect.close();
      }
      return result;
   }   
}