package com.mio.testDemo;

/**
 * Created by liuhe on 16/7/23.
 * update
 */
public class Pair<K, V> {
    public K first;

    public V second;

    public Pair() {}

    public Pair(K first, V second) {
        this.first = first;
        this.second = second;
    }
}