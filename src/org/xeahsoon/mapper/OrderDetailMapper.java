package org.xeahsoon.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.xeahsoon.pojo.OrderDetail;

import com.alibaba.fastjson.JSONObject;

/**
 * @author user
 *
 */
public interface OrderDetailMapper {
	
	/*private int id;			//明细编号
	private int order_id;			//销售单编号
	private int storage_id;			//商品编号
	//private int good_id;
	private Good good;
	private String color;
	private String size;
	private double discount;		//折扣
	private double price;			//单价
	private double dis_price;
	
	  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(8) unsigned zerofill NOT NULL COMMENT '订单号',
  `storage_id` int(11) unsigned zerofill NOT NULL COMMENT '条形码',
  `good_id` int(8) unsigned zerofill NOT NULL COMMENT '款号',
  `color` varchar(8) NOT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '大小',
  `price` double(6,2) NOT NULL COMMENT '单价',
  `discount` double(4,2) NOT NULL DEFAULT '1.00' COMMENT '折扣',
  `dis_price` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '折后价',
	*/
	// 为何一定要用 '${size}' ？？
	@Insert("insert into order_detail(order_id, storage_id, good_id, color, size, price, discount, dis_price) "
			+ "values(#{order_id}, #{storage_id}, #{good_id}, #{color}, '${size}', #{price}, #{discount}, #{dis_price})")
	int insertDetail(
			@Param("order_id")int order_id,
			@Param("storage_id")int storage_id,
			@Param("good_id")int good_id,
			@Param("color")String color,
			@Param("size")String size,
			@Param("price")double price,
			@Param("discount")double discount,
			@Param("dis_price")double dis_price);
	
	/**
	 * @param order_id 订单编号
	 * @return 指定订单ID的详细条目数
	 */
	@Select("select * from order_detail where order_id = #{order_id}")
	@Results({
		@Result(id=true, column="id", property="id"),
		@Result(column="order_id", property="order_id"),
		@Result(column="storage_id", property="storage_id"),
		@Result(column="good_id", property="good",
		one=@One(
				select = "org.xeahsoon.mapper.GoodMapper.findGoodInfoWithID")),
		@Result(column="color", property="color"),
		@Result(column="size", property="size"),
		@Result(column="discount", property="discount"),
		@Result(column="price", property="price"),
		@Result(column="dis_price", property="dis_price"),
		@Result(column="return_flag", property="return_flag")
	})
	List<OrderDetail> listAllDetailsByID(@Param("order_id")int order_id);
	
	/**
	 * @param order_id 订单号
	 * @param storage_id 商品号
	 * @return 更新return_flag，标记为已退货
	 */
	@Update("update `order_detail` set return_flag = '1' where order_id = #{order_id} and storage_id = #{storage_id}")
	int updateDetailFlag(@Param("order_id")int order_id, @Param("storage_id")int storage_id);
	
	/**
	 * @param from
	 * @param to
	 * @return 返回sum_money, nums, snums, staff_id
	 */
	@Select("<script>"+
			"select sum_money, nums, snums, name from ( "+
				"select o.id, o.sum_money, o.nums, s.name "+
				"from `order` o, `order_staff` os, `staff` s "+
				"where os.order_id = o.id and os.staff_id = s.id "+
				"<if test='from != null'> "+
				"and o.create_date &gt; #{from} "+
				"</if> "+
				"<if test='to != null'> "+
				"and o.create_date &lt; #{to} "+
				"</if> "+
			") as t  "+
			"left join ( "+
				"select o1.id, count(o1.id) as snums "+
				"from `order` o1, `order_staff` os1 "+
				"where os1.order_id = o1.id "+
				"group by o1.id "+
			") as t1 "+
			"on t.id = t1.id" +
			"</script>")
	List<JSONObject> getStaffSales(@Param("from")Date from, @Param("to")Date to);
	
	/**
	 * @return name, effort, nums, onums
	 */
	@Select("select s.name as name, sum(o.sum_money) as effort, sum(o.nums) as nums, count(o.id) as onums "
			+ "from `order` o, `order_staff` os, staff s "
			+ "where os.order_id = o.id and os.staff_id = s.id "
			+ "group by s.name;")
	List<JSONObject> getStaffSalesBeta();
	
	/**
	 * @param to 
	 * @param from 
	 * @return 款号销售数据
	 */
	@Select("<script>"
			+ "select good_id as field, count(*) as num, sum(dis_price) as price "
			+ "from order_detail "
			+ "where 1=1 "
			+ "<if test='from != null'> "
			+ "and (select create_date from `order` where id = order_id) &gt; #{from} "
			+ "</if> "
			+ "<if test='to != null'> "
			+ "and (select create_date from `order` where id = order_id) &lt; #{to} "
			+ "</if> "
			+ "group by field"
			+ "</script>")
	List<JSONObject> getGoodStatics(@Param("from")Date from, @Param("to")Date to);
	
	/**
	 * @return 类型销售数据
	 */
	@Select("<script>"
			+ "select (select type from good where id=good_id) as field, count(*) as num, sum(dis_price) as price "
			+ "from order_detail "
			+ "where 1=1 "
			+ "<if test='from != null'> "
			+ "and (select create_date from `order` where id = order_id) &gt; #{from} "
			+ "</if> "
			+ "<if test='to != null'> "
			+ "and (select create_date from `order` where id = order_id) &lt; #{to} "
			+ "</if> "
			+ "group by field"
			+ "</script>")
	List<JSONObject> getTypeStatics(@Param("from")Date from, @Param("to")Date to);
	
	/**
	 * @return 店长销售数据
	 */
	@Select("<script>"
			+ "select (select name from `user` where id = (select user_id from `order` where id = order_id)) as field, "
			+ "count(*) as num, sum(dis_price) as price "
			+ "from `order_detail` "
			+ "where 1=1 "
			+ "<if test='from != null'> "
			+ "and (select create_date from `order` where id = order_id) &gt; #{from} "
			+ "</if> "
			+ "<if test='to != null'> "
			+ "and (select create_date from `order` where id = order_id) &lt; #{to} "
			+ "</if> "
			+ "group by field"
			+ "</script>")
	List<JSONObject> getUserStatics(@Param("from")Date from, @Param("to")Date to);
	
	/**
	 * @return 支付方式统计数据
	 */
	@Select("<script>"
			+ "select (select pay_mode from `order` where id = order_id) as field, "
			+ "count(*) as num, sum(dis_price) as price "
			+ "from `order_detail` "
			+ "where 1=1 "
			+ "<if test='from != null'> "
			+ "and (select create_date from `order` where id = order_id) &gt; #{from} "
			+ "</if> "
			+ "<if test='to != null'> "
			+ "and (select create_date from `order` where id = order_id) &lt; #{to} "
			+ "</if> "
			+ "group by field"
			+ "</script>")
	List<JSONObject> getPayModeStatics(@Param("from")Date from, @Param("to")Date to);
	
	/**
	 * @return 库存类型，数量
	 */
	@Select("select (select type from good where id = good_id) as good_type, count(*) as nums "
			+ "from storage "
			+ "group by good_type")
	List<JSONObject> getLeftGoodTypeNums();
}
