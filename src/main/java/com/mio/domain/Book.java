package com.mio.domain;

import com.mio.utils.DataDictUtils;
import com.mio.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;
import sun.nio.cs.ext.TIS_620;

import java.util.Date;

public class Book {
    private Integer id;

    private String bookName;

    private Integer number;

    private String status;//0:正常 1：丢失 2：损坏 3：外借
    private String statusView;//0:正常 1：丢失 2：损坏 3：外借

    private String other;

    private String isbn;

    private String code;

    private String author;

    private String publisher;

    private String revision;

    private String packaging;

    private String size;

    private Integer wcount;

    private String paper;

    private Integer pcount;

    private Integer suiteNumber;

    private String attachment;

    private Integer attachmentNumber;

    private Integer roomId;

    private Integer shelfId;
    private String shelfName;

    private String location;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date publishTime;
    private String publishTimeView;

    private Double price;

    private String image;

    private String link;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName == null ? null : bookName.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
        this.statusView = DataDictUtils.parseBookStatus(Integer.parseInt(status));
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other == null ? null : other.trim();
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher == null ? null : publisher.trim();
    }

    public String getRevision() {
        return revision;
    }

    public void setRevision(String revision) {
        this.revision = revision == null ? null : revision.trim();
    }

    public String getPackaging() {
        return packaging;
    }

    public void setPackaging(String packaging) {
        this.packaging = packaging == null ? null : packaging.trim();
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size == null ? null : size.trim();
    }

    public Integer getWcount() {
        return wcount;
    }

    public void setWcount(Integer wcount) {
        this.wcount = wcount;
    }

    public String getPaper() {
        return paper;
    }

    public void setPaper(String paper) {
        this.paper = paper == null ? null : paper.trim();
    }

    public Integer getPcount() {
        return pcount;
    }

    public void setPcount(Integer pcount) {
        this.pcount = pcount;
    }

    public Integer getSuiteNumber() {
        return suiteNumber;
    }

    public void setSuiteNumber(Integer suiteNumber) {
        this.suiteNumber = suiteNumber;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment == null ? null : attachment.trim();
    }

    public Integer getAttachmentNumber() {
        return attachmentNumber;
    }

    public void setAttachmentNumber(Integer attachmentNumber) {
        this.attachmentNumber = attachmentNumber;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Integer getShelfId() {
        return shelfId;
    }

    public void setShelfId(Integer shelfId) {
        this.shelfId = shelfId;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
        this.publishTimeView = DateUtils.formatDate(publishTime);
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }

    public String getStatusView() {
        return statusView;
    }

    public void setStatusView(String statusView) {
        this.statusView = statusView;
    }

    public String getShelfName() {
        return shelfName;
    }

    public void setShelfName(String shelfName) {
        this.shelfName = shelfName;
    }

    public String getPublishTimeView() {
        return publishTimeView;
    }

    public void setPublishTimeView(String publishTimeView) {
        this.publishTimeView = publishTimeView;
        this.publishTime = DateUtils.parseString(publishTimeView);
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", bookName='" + bookName + '\'' +
                ", number=" + number +
                ", status='" + status + '\'' +
                ", other='" + other + '\'' +
                ", isbn='" + isbn + '\'' +
                ", code='" + code + '\'' +
                ", author='" + author + '\'' +
                ", publisher='" + publisher + '\'' +
                ", revision='" + revision + '\'' +
                ", packaging='" + packaging + '\'' +
                ", size='" + size + '\'' +
                ", wcount=" + wcount +
                ", paper='" + paper + '\'' +
                ", pcount=" + pcount +
                ", suiteNumber=" + suiteNumber +
                ", attachment='" + attachment + '\'' +
                ", attachmentNumber=" + attachmentNumber +
                ", roomId=" + roomId +
                ", shelfId=" + shelfId +
                ", location='" + location + '\'' +
                ", publishTime=" + publishTime +
                ", price=" + price +
                ", image='" + image + '\'' +
                ", link='" + link + '\'' +
                '}';
    }
}