package com.mio.mapper;

import com.mio.domain.Shelf;
import com.mio.domain.ShelfExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ShelfMapper {
    int countByExample(ShelfExample example);

    int deleteByExample(ShelfExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Shelf record);

    int insertSelective(Shelf record);

    List<Shelf> selectByExample(ShelfExample example);

    Shelf selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Shelf record, @Param("example") ShelfExample example);

    int updateByExample(@Param("record") Shelf record, @Param("example") ShelfExample example);

    int updateByPrimaryKeySelective(Shelf record);

    int updateByPrimaryKey(Shelf record);
}