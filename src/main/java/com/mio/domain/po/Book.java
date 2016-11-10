package com.mio.domain;

import java.util.Date;

/**
 * Created by liuhe on 2016/10/9.
 * update
 */
public class Book {

    private int id;

    private String ISBN;
    private String name;
    private String number;//图书编号
    private String briefCode;//简码
    private String author;
    private Date publicationTime;//出版时间
    private Date printTime;//印刷时间
    private String publisher;//出版社
    private String revision;//版次
    private String packaging;//包装
    private String bookSize;//开本
    private String printPaper;//印刷用纸
    private String printNumber;//次数
    private int wordCount;//字数
    private int numberOfSuite;//套装数量
    private String attachment;//附件
    private int attachmentNumber;//附件数量
    private String other;//备注

    private Room room;//书室
    private BookShelf bookShelf;//书架

    private String locationNumber;//位置


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getBriefCode() {
        return briefCode;
    }

    public void setBriefCode(String briefCode) {
        this.briefCode = briefCode;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getPublicationTime() {
        return publicationTime;
    }

    public void setPublicationTime(Date publicationTime) {
        this.publicationTime = publicationTime;
    }

    public Date getPrintTime() {
        return printTime;
    }

    public void setPrintTime(Date printTime) {
        this.printTime = printTime;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getRevision() {
        return revision;
    }

    public void setRevision(String revision) {
        this.revision = revision;
    }

    public String getPackaging() {
        return packaging;
    }

    public void setPackaging(String packaging) {
        this.packaging = packaging;
    }

    public String getBookSize() {
        return bookSize;
    }

    public void setBookSize(String bookSize) {
        this.bookSize = bookSize;
    }

    public String getPrintPaper() {
        return printPaper;
    }

    public void setPrintPaper(String printPaper) {
        this.printPaper = printPaper;
    }

    public String getPrintNumber() {
        return printNumber;
    }

    public void setPrintNumber(String printNumber) {
        this.printNumber = printNumber;
    }

    public int getWordCount() {
        return wordCount;
    }

    public void setWordCount(int wordCount) {
        this.wordCount = wordCount;
    }

    public int getNumberOfSuite() {
        return numberOfSuite;
    }

    public void setNumberOfSuite(int numberOfSuite) {
        this.numberOfSuite = numberOfSuite;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public int getAttachmentNumber() {
        return attachmentNumber;
    }

    public void setAttachmentNumber(int attachmentNumber) {
        this.attachmentNumber = attachmentNumber;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public BookShelf getBookShelf() {
        return bookShelf;
    }

    public void setBookShelf(BookShelf bookShelf) {
        this.bookShelf = bookShelf;
    }

    public String getLocationNumber() {
        return locationNumber;
    }

    public void setLocationNumber(String locationNumber) {
        this.locationNumber = locationNumber;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", ISBN='" + ISBN + '\'' +
                ", name='" + name + '\'' +
                ", number='" + number + '\'' +
                ", briefCode='" + briefCode + '\'' +
                ", author='" + author + '\'' +
                ", publicationTime=" + publicationTime +
                ", printTime=" + printTime +
                ", publisher='" + publisher + '\'' +
                ", revision='" + revision + '\'' +
                ", packaging='" + packaging + '\'' +
                ", bookSize='" + bookSize + '\'' +
                ", printPaper='" + printPaper + '\'' +
                ", printNumber='" + printNumber + '\'' +
                ", wordCount=" + wordCount +
                ", numberOfSuite=" + numberOfSuite +
                ", attachment='" + attachment + '\'' +
                ", attachmentNumber=" + attachmentNumber +
                ", other='" + other + '\'' +
                ", room=" + room +
                ", bookShelf=" + bookShelf +
                ", locationNumber='" + locationNumber + '\'' +
                '}';
    }
}
