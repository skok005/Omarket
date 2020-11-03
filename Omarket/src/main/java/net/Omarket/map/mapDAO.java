package net.Omarket.map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class mapDAO {

	@Autowired
	SqlSessionTemplate temp;
	
	public void mapInsert(mapDTO dto) {
		temp.insert("map.add", dto);
	}//end
	
}//class END






