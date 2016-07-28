package com.mio.testDemo;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.testng.annotations.Test;

import java.util.List;

/**
 * Created by hel2 on 14/7/2016.
 */
public class GsonTest {





@Test
 public void testGson1(){

     String s = "[\n" +
             "    {\"firstName\":\"John\", \"lastName\":\"Doe\"},\n" +
             "    {\"firstName\":\"Anna\", \"lastName\":\"Smith\"},\n" +
             "    {\"firstName\":\"Peter\", \"lastName\":\"Jones\"}\n" +
             "]";
//     String s = "{[{name:\"zhangsan\",age:16}]}";
     final Gson gson = new Gson();

     final Student student = gson.fromJson(s, Student.class);
    final Object o = gson.fromJson(s, new TypeToken<List<Student>>() {
    }.getType());

    for (Student stu: (List<Student>) o) {
        System.out.println(stu.getName());
        System.out.println(stu.getAge());
    }




 }






    @Test
    public void testStr(){

        String sessionSetupLog = "{\"_bkt\":\"dsm~0~58DD3B8A-E574-42FB-AE8E-0FA4E2B1BFCF\",\"_cd\":\"0:28566931\",\"_indextime\":\"1468823861\",\"_raw\":\"2016-07-18 06:37:39,244 INFO  [net.beaumaris.session] (ServerService_Thread_Pool_--_52--workflow-worker-22669) Session setup successfully{EventType=SessionCreated, ComponentName=SM, SetupWorkflowName=workflows/CATV-Verizon-SM-SetupSession.js, TeardownWorkflowName=workflows/CATV-Verizon-SM-ReleaseSession.js, sessionId=6c720fdb341a07834f0b, Bitrate=7110380, Playlist=net.beaumaris.common.xsd.PlayList@4116fd77[content={net.beaumaris.common.xsd.Content@15d5141f[providerId=wbhd.com, assetId=olesMovieId001, fileName=Movie_moto_encr-1468222581611, startTime=3003, stopTime=439439, itemType=PROGRAM, adTrackingId=<null>, itemRequired=<null>, serverSlot=0, trickModeRestrictions=net.beaumaris.common.xsd.Content$TrickModeRestrictions@6ff38574[canFF=<null>, canREW=<null>, canPAU=<null>], contentId=<null>, source=<null>, splicePoints=<null>, ecmRecord=net.beaumaris.common.xsd.ECMRecord@da48d32[titleIdCode=<null>, minDelay=0.125, ecmData={net.beaumaris.common.xsd.ECMData@528b4e60[message=ODhmNjcxMzcyYzVkZmY1NTI3YzMyYWJiMzQxNmRkZjk4YTE0NmQxZg==, programNumberOffset=5],net.beaumaris.common.xsd.ECMData@2120b960[message=OTBkODk5YjZkYzQ5MjBhMzcwNWIzMDAwYjRmNzI4MmViMTQwZTVmMA==, programNumberOffset=5],net.beaumaris.common.xsd.ECMData@8c46d6b[message=NmQ5NzhkNDVhOTAzMjU0MTQyYWY5OGM5MGI3NjUwMzIzYTQ4MzFhNA==, programNumberOffset=7]}]],net.beaumaris.common.xsd.Content@4ddf5d3b[providerId=wbhd.com, assetId=olesMovieId001, fileName=Movie_moto_encr-1468222581611, startTime=469468, stopTime=913913, itemType=PROGRAM, adTrackingId=<null>, itemRequired=<null>, serverSlot=1, trickModeRestrictions=net.beaumaris.common.xsd.Content$TrickModeRestrictions@75453681[canFF=<null>, canREW=<null>, canPAU=<null>], contentId=<null>, source=<null>, splicePoints=<null>, ecmRecord=net.beaumaris.common.xsd.ECMRecord@7db58e07[titleIdCode=<null>, minDelay=0.125, ecmData={net.beaumaris.common.xsd.ECMData@72fe4219[message=ODhmNjcxMzcyYzVkZmY1NTI3YzMyYWJiMzQxNmRkZjk4YTE0NmQxZg==, programNumberOffset=5],net.beaumaris.common.xsd.ECMData@2e5383f9[message=OTBkODk5YjZkYzQ5MjBhMzcwNWIzMDAwYjRmNzI4MmViMTQwZTVmMA==, programNumberOffset=5],net.beaumaris.common.xsd.ECMData@7f47f582[message=NmQ5NzhkNDVhOTAzMjU0MTQyYWY5OGM5MGI3NjUwMzIzYTQ4MzFhNA==, programNumberOffset=7]}]],net.beaumaris.common.xsd.Content@35300991[providerId=wbhd.com, assetId=olesMovieId001, fileName=Movie_moto_encr-1468222581611, startTime=943943, stopTime=1414410, itemType=PROGRAM, adTrackingId=<null>, itemRequired=<null>, serverSlot=2, trickModeRestrictions=net.beaumaris.common.xsd.Content$TrickModeRestrictions@70299891[canFF=<null>, canREW=<null>, canPAU=<null>], contentId=<null>, source=<null>, splicePoints=<null>, ecmRecord=net.beaumaris.common.xsd.ECMRecord@7047f207[titleIdCode=<null>, minDelay=0.125, ecmData={net.beaumaris.common.xsd.ECMData@292ed8d[message=ODhmNjcxMzcyYzVkZmY1NTI3YzMyYWJiMzQxNmRkZjk4YTE0NmQxZg==, programNumberOffset=5],net.beaumaris.common.xsd.ECMData@3e43005e[message=OTBkODk5YjZkYzQ5MjBhMzcwNWIzMDAwYjRmNzI4MmViMTQwZTVmMA==, programNumberOffset=5],net.beaumaris.common.xsd.ECMData@715b0a5b[message=NmQ5NzhkNDVhOTAzMjU0MTQyYWY5OGM5MGI3NjUwMzIzYTQ4MzFhNA==, programNumberOffset=7]}]],net.beaumaris.common.xsd.Content@5f8427e9[providerId=wbhd.com, assetId=olesMovieId001, fileName=Movie_moto_encr-1468222581611, startTime=1444440, stopTime=1921920, itemType=PROGRAM, adTrackingId=<null>, itemRequired=<null>, serverSlot=3, trickModeRestrictions=net.beaumaris.common.xsd.Content$TrickModeRestrictions@7c32e3ce[canFF=<null>, canREW=<null>, canPAU=<null>], contentId=<null>, source=<null>, splicePoints=<null>, ecmRecord=net.beaumaris.common.xsd.ECMRecord@69d98740[titleIdCode=<null>, minDelay=0.125, ecmData={net.beaumaris.common.xsd.ECMData@669ef9bb[message=ODhmNjcxMzcyYzVkZmY1NTI3YzMyYWJiMzQxNmRkZjk4YTE0NmQxZg==, programNumberOffset=5],net.beaumaris.common.xsd.ECMData@dd95a35[message=OTBkODk5YjZkYzQ5MjBhMzcwNWIzMDAwYjRmNzI4MmViMTQwZTVmMA==, programNumberOffset=5],net.beaumaris.common.xsd.ECMData@281f2f49[message=NmQ5NzhkNDVhOTAzMjU0MTQyYWY5OGM5MGI3NjUwMzIzYTQ4MzFhNA==, programNumberOffset=7]}]],net.beaumaris.common.xsd.Content@31ef90bb[providerId=wbhd.com, assetId=olesMovieId001, fileName=Movie_moto_encr-1468222581611, startTime=1951950, stopTime=2303300, itemType=PROGRAM, adTrackingId=<null>, itemRequired=<null>, serverSlot=4, trickModeRestrictions=net.beaumaris.common.xsd.Content$TrickModeRestrictions@16c1d91c[canFF=<null>, canREW=<null>, canPAU=<null>], contentId=<null>, source=<null>, splicePoints=<null>, ecmRecord=net.beaumaris.common.xsd.ECMRecord@783a95e[titleIdCode=<null>, minDelay=0.125, ecmData={net.beaumaris.common.xsd.ECMData@11f8595e[message=ODhmNjcxMzcyYzVkZmY1NTI3YzMyYWJiMzQxNmRkZjk4YTE0NmQxZg==, programNumberOffset=5],net.beaumaris.common.xsd.ECMData@9e96b44[message=OTBkODk5YjZkYzQ5MjBhMzcwNWIzMDAwYjRmNzI4MmViMTQwZTVmMA==, programNumberOffset=5],net.beaumaris.common.xsd.ECMData@133afa7e[message=NmQ5NzhkNDVhOTAzMjU0MTQyYWY5OGM5MGI3NjUwMzIzYTQ4MzFhNA==, programNumberOffset=7]}]],net.beaumaris.common.xsd.Content@154b75b0[providerId=wbhd.com, assetId=olesMovieId001, fileName=Movie_moto_encr-1468222581611, startTime=2323320, stopTime=<null>, itemType=PROGRAM, adTrackingId=<null>, itemRequired=<null>, serverSlot=5, trickModeRestrictions=net.beaumaris.common.xsd.Content$TrickModeRestrictions@314fb46b[canFF=<null>, canREW=<null>, canPAU=<null>], contentId=<null>, source=<null>, splicePoints=<null>, ecmRecord=net.beaumaris.common.xsd.ECMRecord@62ae29b5[titleIdCode=<null>, minDelay=0.125, ecmData={net.beaumaris.common.xsd.ECMData@64723a90[message=ODhmNjcxMzcyYzVkZmY1NTI3YzMyYWJiMzQxNmRkZjk4YTE0NmQxZg==, programNumberOffset=5],net.beaumaris.common.xsd.ECMData@28d23699[message=OTBkODk5YjZkYzQ5MjBhMzcwNWIzMDAwYjRmNzI4MmViMTQwZTVmMA==, programNumberOffset=5],net.beaumaris.common.xsd.ECMData@3ba251b7[message=NmQ5NzhkNDVhOTAzMjU0MTQyYWY5OGM5MGI3NjUwMzIzYTQ4MzFhNA==, programNumberOffset=7]}]]}, vnsSessionRef=<null>], NPT=1656.9, ContentUUID=urn:X-ADI11:wbhd.com:olesMovieId001, OfferingId=1467960420, PidPaid=urn:X-ADI11:wbhd.com:titleId001, Filename=Movie_moto_encr-1468222581611, IsPreview=false, EncodingType=MPEG-2, SignalingURL=http://10.20.115.98:8080/generic_rtsp_client_pc/GenericRtspServerTeardown/6c720fdb341a, ClientID=10.20.115.104|6c720fdb341a, ClientSessionId=6c720fdb341a07834f0b, ClientIP=10.20.10.137, ClientReportedIP=10.20.115.104, SessionGroup=bnisessiongroup5, SopName=10.0.0.0/8, IsEncrypted=Y, Price=0, AuthorizationType=TVOD, PurchaseId=3faf6320-c3c9-4060-849b-3caf922f93ac, RentalType=EXTENDED_RENTAL, PurchaseDate=2014-01-25T13:00:00Z, EntitlementExpiration=2014-03-15T16:00:00Z, RentalPeriod=24, MPEG2OfferingId=N/A, SessionSetupTime=212, ComponentName=SM}\",\"_serial\":\"0\",\"_si\":[\"verizon5-hel2-nonhaidx0\",\"dsm\"],\"_sourcetype\":\"csco_vsi_jboss\",\"_subsecond\":\".244\",\"_time\":\"2016-07-18T06:37:39.244+00:00\",\"host\":\"verizon5-hel2-hasm0\",\"index\":\"dsm\",\"linecount\":\"1\",\"source\":\"/opt/jboss-as/standalone/log/vbo/jboss.log\",\"sourcetype\":\"jboss\",\"splunk_server\":\"verizon5-hel2-nonhaidx0\"}";


        String sub = sessionSetupLog.substring(sessionSetupLog.indexOf("SessionSetupTime="));
        System.out.println(sub);
        sub = sub.substring(0,sub.indexOf(","));

        System.out.println(sub);
//        Pattern pattern = Pattern.compile("[0-9]*");
//        return pattern.matcher(str).matches();


    }

}
