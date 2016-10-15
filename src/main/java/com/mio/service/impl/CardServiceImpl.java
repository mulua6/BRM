package com.mio.service.impl;

import com.mio.domain.Card;
import com.mio.domain.CardExample;
import com.mio.mapper.CardMapper;
import com.mio.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public class CardServiceImpl implements CardService{

    @Autowired
    public CardMapper cardMapper;

    @Override
    public List<Card> findAllCards() {
        return cardMapper.selectByExample(new CardExample());
    }

    @Override
    public void addCard(Card card) {
        cardMapper.insertSelective(card);
    }

    @Override
    public void deleteCard(Integer id) {
        cardMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateCard(Card card) {
        cardMapper.updateByPrimaryKey(card);
    }

    @Override
    public Card findCardById(Integer id) {
        return cardMapper.selectByPrimaryKey(id);
    }
}
