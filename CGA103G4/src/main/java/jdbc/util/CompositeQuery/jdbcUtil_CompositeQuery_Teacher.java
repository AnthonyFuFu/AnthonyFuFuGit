
 /*  1. 萬用複合查詢-可由客戶端隨意增減任何想查詢的欄位 */


package jdbc.util.CompositeQuery;

import java.util.*;

public class jdbcUtil_CompositeQuery_Teacher {

	public static String get_aCondition_For_myDB(String columnName, String value) {

		String aCondition = null;

		if ("thrid".equals(columnName) ||"thrPhone".equals(columnName)||
				"thrEmail".equals(columnName)||"thrStatus".equals(columnName)||"thrStatus".equals(columnName)) // 用於其他
			aCondition = columnName + "=" + value;
		else if ("thrGender".equals(columnName)) // 用於其他
			aCondition = columnName + "=" + "'"+value+"'";
		else if ("thrName".equals(columnName) || "thrIntroduction".equals(columnName) ) // 用於varchar
			aCondition = columnName + " like '%" + value + "%'";
		else if ("thrComment".equals(columnName) ||"thrCmnumber".equals(columnName) ) // 用於評價
			aCondition = columnName + ">=" + value ;
		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)) {
				count++;
				String aCondition = get_aCondition_For_myDB(key, value.trim());

				if (count == 1)
					whereCondition.append(" where " + aCondition);
				else
					whereCondition.append(" and " + aCondition);

				System.out.println("有送出查詢資料的欄位數count = " + count);
			}
		}
		
		return whereCondition.toString();
	}

	public static void main(String argv[]) {

		// 配合 req.getParameterMap()方法 回傳 java.util.Map<java.lang.String,java.lang.String[]> 之測試
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("thrid", new String[] {"" });
		map.put("thrName", new String[] { "" });
		map.put("thrGender", new String[] { "" });
		map.put("thrPhone", new String[] { "" });
		map.put("thrEmail", new String[] { "" });
		map.put("thrStatus", new String[] { "" });
		map.put("thrIntroduction", new String[] { "" });
		map.put("thrComment", new String[] { "1" });
		map.put("thrCmnumber", new String[] { "" });
		map.put("action", new String[] { "getXXX" }); // 注意Map裡面會含有action的key

		String finalSQL = "select * from teacher "
				          + jdbcUtil_CompositeQuery_Teacher.get_WhereCondition(map)
				          + "order by thrid ";
		System.out.println("●●finalSQL = " + finalSQL);

	}
}
