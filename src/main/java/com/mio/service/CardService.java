package com.mio.service;

import com.mio.domain.Card;

import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public interface CardService {

    public List<Card> findAllCards();

    void addCard(Card card);

    void deleteCard(Integer id);

    void updateCard(Card card);

    Card findCardById(Integer id);
}
