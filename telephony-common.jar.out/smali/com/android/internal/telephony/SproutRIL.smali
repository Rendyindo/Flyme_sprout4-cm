.class public Lcom/android/internal/telephony/SproutRIL;
.super Lcom/android/internal/telephony/RIL;
.source "SproutRIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;
    }
.end annotation


# static fields
.field static final RIL_REQUEST_ALLOW_DATA:I = 0x7d

.field static final RIL_REQUEST_GET_HARDWARE_CONFIG:I = 0x7a

.field static final RIL_REQUEST_SET_3G_CAPABILITY:I = 0x80

.field static final RIL_REQUEST_SET_UICC_SUBSCRIPTION:I = 0x7c

.field static registered:I


# direct methods
.method static synthetic -wrap0(Ljava/io/InputStream;[B)I
    .locals 1
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "buffer"    # [B

    .prologue
    invoke-static {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->readRilMessage(Ljava/io/InputStream;[B)I

    move-result v0

    return v0
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x0

    sput v0, Lcom/android/internal/telephony/SproutRIL;->registered:I

    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "networkMode"    # I
    .param p3, "cdmaSubscription"    # I

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/Integer;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "networkMode"    # I
    .param p3, "cdmaSubscription"    # I
    .param p4, "instanceId"    # Ljava/lang/Integer;

    .prologue
    .line 56
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 55
    return-void
.end method

.method private static readRilMessage(Ljava/io/InputStream;[B)I
    .locals 8
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    const/4 v4, 0x0

    .line 67
    const/4 v2, 0x0

    .line 68
    .local v2, "offset":I
    const/4 v3, 0x4

    .line 70
    .local v3, "remaining":I
    :cond_0
    invoke-virtual {p0, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 72
    .local v0, "countRead":I
    if-gez v0, :cond_1

    .line 73
    const-string/jumbo v4, "RILJ"

    const-string/jumbo v5, "Hit EOS reading message length"

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    return v7

    .line 77
    :cond_1
    add-int/2addr v2, v0

    .line 78
    sub-int/2addr v3, v0

    .line 79
    if-gtz v3, :cond_0

    .line 81
    aget-byte v4, p1, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x18

    .line 82
    const/4 v5, 0x1

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x10

    .line 81
    or-int/2addr v4, v5

    .line 83
    const/4 v5, 0x2

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    .line 81
    or-int/2addr v4, v5

    .line 84
    const/4 v5, 0x3

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    .line 81
    or-int v1, v4, v5

    .line 87
    .local v1, "messageLength":I
    const/4 v2, 0x0

    .line 88
    move v3, v1

    .line 90
    :cond_2
    invoke-virtual {p0, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 92
    if-gez v0, :cond_3

    .line 93
    const-string/jumbo v4, "RILJ"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Hit EOS reading message.  messageLength="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 94
    const-string/jumbo v6, " remaining="

    .line 93
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    return v7

    .line 98
    :cond_3
    add-int/2addr v2, v0

    .line 99
    sub-int/2addr v3, v0

    .line 100
    if-gtz v3, :cond_2

    .line 102
    return v1
.end method

.method static requestToString(I)Ljava/lang/String;
    .locals 1
    .param p0, "request"    # I

    .prologue
    .line 536
    packed-switch p0, :pswitch_data_0

    .line 671
    :pswitch_0
    const-string/jumbo v0, "<unknown request>"

    return-object v0

    .line 537
    :pswitch_1
    const-string/jumbo v0, "GET_SIM_STATUS"

    return-object v0

    .line 538
    :pswitch_2
    const-string/jumbo v0, "ENTER_SIM_PIN"

    return-object v0

    .line 539
    :pswitch_3
    const-string/jumbo v0, "ENTER_SIM_PUK"

    return-object v0

    .line 540
    :pswitch_4
    const-string/jumbo v0, "ENTER_SIM_PIN2"

    return-object v0

    .line 541
    :pswitch_5
    const-string/jumbo v0, "ENTER_SIM_PUK2"

    return-object v0

    .line 542
    :pswitch_6
    const-string/jumbo v0, "CHANGE_SIM_PIN"

    return-object v0

    .line 543
    :pswitch_7
    const-string/jumbo v0, "CHANGE_SIM_PIN2"

    return-object v0

    .line 544
    :pswitch_8
    const-string/jumbo v0, "ENTER_NETWORK_DEPERSONALIZATION"

    return-object v0

    .line 545
    :pswitch_9
    const-string/jumbo v0, "GET_CURRENT_CALLS"

    return-object v0

    .line 546
    :pswitch_a
    const-string/jumbo v0, "DIAL"

    return-object v0

    .line 547
    :pswitch_b
    const-string/jumbo v0, "GET_IMSI"

    return-object v0

    .line 548
    :pswitch_c
    const-string/jumbo v0, "HANGUP"

    return-object v0

    .line 549
    :pswitch_d
    const-string/jumbo v0, "HANGUP_WAITING_OR_BACKGROUND"

    return-object v0

    .line 550
    :pswitch_e
    const-string/jumbo v0, "HANGUP_FOREGROUND_RESUME_BACKGROUND"

    return-object v0

    .line 551
    :pswitch_f
    const-string/jumbo v0, "REQUEST_SWITCH_WAITING_OR_HOLDING_AND_ACTIVE"

    return-object v0

    .line 552
    :pswitch_10
    const-string/jumbo v0, "CONFERENCE"

    return-object v0

    .line 553
    :pswitch_11
    const-string/jumbo v0, "UDUB"

    return-object v0

    .line 554
    :pswitch_12
    const-string/jumbo v0, "LAST_CALL_FAIL_CAUSE"

    return-object v0

    .line 555
    :pswitch_13
    const-string/jumbo v0, "SIGNAL_STRENGTH"

    return-object v0

    .line 556
    :pswitch_14
    const-string/jumbo v0, "VOICE_REGISTRATION_STATE"

    return-object v0

    .line 557
    :pswitch_15
    const-string/jumbo v0, "DATA_REGISTRATION_STATE"

    return-object v0

    .line 558
    :pswitch_16
    const-string/jumbo v0, "OPERATOR"

    return-object v0

    .line 559
    :pswitch_17
    const-string/jumbo v0, "RADIO_POWER"

    return-object v0

    .line 560
    :pswitch_18
    const-string/jumbo v0, "DTMF"

    return-object v0

    .line 561
    :pswitch_19
    const-string/jumbo v0, "SEND_SMS"

    return-object v0

    .line 562
    :pswitch_1a
    const-string/jumbo v0, "SEND_SMS_EXPECT_MORE"

    return-object v0

    .line 563
    :pswitch_1b
    const-string/jumbo v0, "SETUP_DATA_CALL"

    return-object v0

    .line 564
    :pswitch_1c
    const-string/jumbo v0, "SIM_IO"

    return-object v0

    .line 565
    :pswitch_1d
    const-string/jumbo v0, "SEND_USSD"

    return-object v0

    .line 566
    :pswitch_1e
    const-string/jumbo v0, "CANCEL_USSD"

    return-object v0

    .line 567
    :pswitch_1f
    const-string/jumbo v0, "GET_CLIR"

    return-object v0

    .line 568
    :pswitch_20
    const-string/jumbo v0, "SET_CLIR"

    return-object v0

    .line 569
    :pswitch_21
    const-string/jumbo v0, "QUERY_CALL_FORWARD_STATUS"

    return-object v0

    .line 570
    :pswitch_22
    const-string/jumbo v0, "SET_CALL_FORWARD"

    return-object v0

    .line 571
    :pswitch_23
    const-string/jumbo v0, "QUERY_CALL_WAITING"

    return-object v0

    .line 572
    :pswitch_24
    const-string/jumbo v0, "SET_CALL_WAITING"

    return-object v0

    .line 573
    :pswitch_25
    const-string/jumbo v0, "SMS_ACKNOWLEDGE"

    return-object v0

    .line 574
    :pswitch_26
    const-string/jumbo v0, "GET_IMEI"

    return-object v0

    .line 575
    :pswitch_27
    const-string/jumbo v0, "GET_IMEISV"

    return-object v0

    .line 576
    :pswitch_28
    const-string/jumbo v0, "ANSWER"

    return-object v0

    .line 577
    :pswitch_29
    const-string/jumbo v0, "DEACTIVATE_DATA_CALL"

    return-object v0

    .line 578
    :pswitch_2a
    const-string/jumbo v0, "QUERY_FACILITY_LOCK"

    return-object v0

    .line 579
    :pswitch_2b
    const-string/jumbo v0, "SET_FACILITY_LOCK"

    return-object v0

    .line 580
    :pswitch_2c
    const-string/jumbo v0, "CHANGE_BARRING_PASSWORD"

    return-object v0

    .line 581
    :pswitch_2d
    const-string/jumbo v0, "QUERY_NETWORK_SELECTION_MODE"

    return-object v0

    .line 582
    :pswitch_2e
    const-string/jumbo v0, "SET_NETWORK_SELECTION_AUTOMATIC"

    return-object v0

    .line 583
    :pswitch_2f
    const-string/jumbo v0, "SET_NETWORK_SELECTION_MANUAL"

    return-object v0

    .line 584
    :pswitch_30
    const-string/jumbo v0, "QUERY_AVAILABLE_NETWORKS "

    return-object v0

    .line 585
    :pswitch_31
    const-string/jumbo v0, "DTMF_START"

    return-object v0

    .line 586
    :pswitch_32
    const-string/jumbo v0, "DTMF_STOP"

    return-object v0

    .line 587
    :pswitch_33
    const-string/jumbo v0, "BASEBAND_VERSION"

    return-object v0

    .line 588
    :pswitch_34
    const-string/jumbo v0, "SEPARATE_CONNECTION"

    return-object v0

    .line 589
    :pswitch_35
    const-string/jumbo v0, "SET_MUTE"

    return-object v0

    .line 590
    :pswitch_36
    const-string/jumbo v0, "GET_MUTE"

    return-object v0

    .line 591
    :pswitch_37
    const-string/jumbo v0, "QUERY_CLIP"

    return-object v0

    .line 592
    :pswitch_38
    const-string/jumbo v0, "LAST_DATA_CALL_FAIL_CAUSE"

    return-object v0

    .line 593
    :pswitch_39
    const-string/jumbo v0, "DATA_CALL_LIST"

    return-object v0

    .line 594
    :pswitch_3a
    const-string/jumbo v0, "RESET_RADIO"

    return-object v0

    .line 595
    :pswitch_3b
    const-string/jumbo v0, "OEM_HOOK_RAW"

    return-object v0

    .line 596
    :pswitch_3c
    const-string/jumbo v0, "OEM_HOOK_STRINGS"

    return-object v0

    .line 597
    :pswitch_3d
    const-string/jumbo v0, "SCREEN_STATE"

    return-object v0

    .line 598
    :pswitch_3e
    const-string/jumbo v0, "SET_SUPP_SVC_NOTIFICATION"

    return-object v0

    .line 599
    :pswitch_3f
    const-string/jumbo v0, "WRITE_SMS_TO_SIM"

    return-object v0

    .line 600
    :pswitch_40
    const-string/jumbo v0, "DELETE_SMS_ON_SIM"

    return-object v0

    .line 601
    :pswitch_41
    const-string/jumbo v0, "SET_BAND_MODE"

    return-object v0

    .line 602
    :pswitch_42
    const-string/jumbo v0, "QUERY_AVAILABLE_BAND_MODE"

    return-object v0

    .line 603
    :pswitch_43
    const-string/jumbo v0, "REQUEST_STK_GET_PROFILE"

    return-object v0

    .line 604
    :pswitch_44
    const-string/jumbo v0, "REQUEST_STK_SET_PROFILE"

    return-object v0

    .line 605
    :pswitch_45
    const-string/jumbo v0, "REQUEST_STK_SEND_ENVELOPE_COMMAND"

    return-object v0

    .line 606
    :pswitch_46
    const-string/jumbo v0, "REQUEST_STK_SEND_TERMINAL_RESPONSE"

    return-object v0

    .line 607
    :pswitch_47
    const-string/jumbo v0, "REQUEST_STK_HANDLE_CALL_SETUP_REQUESTED_FROM_SIM"

    return-object v0

    .line 608
    :pswitch_48
    const-string/jumbo v0, "REQUEST_EXPLICIT_CALL_TRANSFER"

    return-object v0

    .line 609
    :pswitch_49
    const-string/jumbo v0, "REQUEST_SET_PREFERRED_NETWORK_TYPE"

    return-object v0

    .line 610
    :pswitch_4a
    const-string/jumbo v0, "REQUEST_GET_PREFERRED_NETWORK_TYPE"

    return-object v0

    .line 611
    :pswitch_4b
    const-string/jumbo v0, "REQUEST_GET_NEIGHBORING_CELL_IDS"

    return-object v0

    .line 612
    :pswitch_4c
    const-string/jumbo v0, "REQUEST_SET_LOCATION_UPDATES"

    return-object v0

    .line 613
    :pswitch_4d
    const-string/jumbo v0, "RIL_REQUEST_CDMA_SET_SUBSCRIPTION_SOURCE"

    return-object v0

    .line 614
    :pswitch_4e
    const-string/jumbo v0, "RIL_REQUEST_CDMA_SET_ROAMING_PREFERENCE"

    return-object v0

    .line 615
    :pswitch_4f
    const-string/jumbo v0, "RIL_REQUEST_CDMA_QUERY_ROAMING_PREFERENCE"

    return-object v0

    .line 616
    :pswitch_50
    const-string/jumbo v0, "RIL_REQUEST_SET_TTY_MODE"

    return-object v0

    .line 617
    :pswitch_51
    const-string/jumbo v0, "RIL_REQUEST_QUERY_TTY_MODE"

    return-object v0

    .line 618
    :pswitch_52
    const-string/jumbo v0, "RIL_REQUEST_CDMA_SET_PREFERRED_VOICE_PRIVACY_MODE"

    return-object v0

    .line 619
    :pswitch_53
    const-string/jumbo v0, "RIL_REQUEST_CDMA_QUERY_PREFERRED_VOICE_PRIVACY_MODE"

    return-object v0

    .line 620
    :pswitch_54
    const-string/jumbo v0, "RIL_REQUEST_CDMA_FLASH"

    return-object v0

    .line 621
    :pswitch_55
    const-string/jumbo v0, "RIL_REQUEST_CDMA_BURST_DTMF"

    return-object v0

    .line 622
    :pswitch_56
    const-string/jumbo v0, "RIL_REQUEST_CDMA_SEND_SMS"

    return-object v0

    .line 623
    :pswitch_57
    const-string/jumbo v0, "RIL_REQUEST_CDMA_SMS_ACKNOWLEDGE"

    return-object v0

    .line 624
    :pswitch_58
    const-string/jumbo v0, "RIL_REQUEST_GSM_GET_BROADCAST_CONFIG"

    return-object v0

    .line 625
    :pswitch_59
    const-string/jumbo v0, "RIL_REQUEST_GSM_SET_BROADCAST_CONFIG"

    return-object v0

    .line 626
    :pswitch_5a
    const-string/jumbo v0, "RIL_REQUEST_CDMA_GET_BROADCAST_CONFIG"

    return-object v0

    .line 627
    :pswitch_5b
    const-string/jumbo v0, "RIL_REQUEST_CDMA_SET_BROADCAST_CONFIG"

    return-object v0

    .line 628
    :pswitch_5c
    const-string/jumbo v0, "RIL_REQUEST_GSM_BROADCAST_ACTIVATION"

    return-object v0

    .line 629
    :pswitch_5d
    const-string/jumbo v0, "RIL_REQUEST_CDMA_VALIDATE_AND_WRITE_AKEY"

    return-object v0

    .line 630
    :pswitch_5e
    const-string/jumbo v0, "RIL_REQUEST_CDMA_BROADCAST_ACTIVATION"

    return-object v0

    .line 631
    :pswitch_5f
    const-string/jumbo v0, "RIL_REQUEST_CDMA_SUBSCRIPTION"

    return-object v0

    .line 632
    :pswitch_60
    const-string/jumbo v0, "RIL_REQUEST_CDMA_WRITE_SMS_TO_RUIM"

    return-object v0

    .line 633
    :pswitch_61
    const-string/jumbo v0, "RIL_REQUEST_CDMA_DELETE_SMS_ON_RUIM"

    return-object v0

    .line 634
    :pswitch_62
    const-string/jumbo v0, "RIL_REQUEST_DEVICE_IDENTITY"

    return-object v0

    .line 635
    :pswitch_63
    const-string/jumbo v0, "RIL_REQUEST_GET_SMSC_ADDRESS"

    return-object v0

    .line 636
    :pswitch_64
    const-string/jumbo v0, "RIL_REQUEST_SET_SMSC_ADDRESS"

    return-object v0

    .line 637
    :pswitch_65
    const-string/jumbo v0, "REQUEST_EXIT_EMERGENCY_CALLBACK_MODE"

    return-object v0

    .line 638
    :pswitch_66
    const-string/jumbo v0, "RIL_REQUEST_REPORT_SMS_MEMORY_STATUS"

    return-object v0

    .line 639
    :pswitch_67
    const-string/jumbo v0, "RIL_REQUEST_REPORT_STK_SERVICE_IS_RUNNING"

    return-object v0

    .line 640
    :pswitch_68
    const-string/jumbo v0, "RIL_REQUEST_CDMA_GET_SUBSCRIPTION_SOURCE"

    return-object v0

    .line 641
    :pswitch_69
    const-string/jumbo v0, "RIL_REQUEST_ISIM_AUTHENTICATION"

    return-object v0

    .line 642
    :pswitch_6a
    const-string/jumbo v0, "RIL_REQUEST_ACKNOWLEDGE_INCOMING_GSM_SMS_WITH_PDU"

    return-object v0

    .line 643
    :pswitch_6b
    const-string/jumbo v0, "RIL_REQUEST_STK_SEND_ENVELOPE_WITH_STATUS"

    return-object v0

    .line 644
    :pswitch_6c
    const-string/jumbo v0, "RIL_REQUEST_VOICE_RADIO_TECH"

    return-object v0

    .line 645
    :pswitch_6d
    const-string/jumbo v0, "RIL_REQUEST_GET_CELL_INFO_LIST"

    return-object v0

    .line 646
    :pswitch_6e
    const-string/jumbo v0, "RIL_REQUEST_SET_CELL_INFO_LIST_RATE"

    return-object v0

    .line 647
    :pswitch_6f
    const-string/jumbo v0, "RIL_REQUEST_SET_INITIAL_ATTACH_APN"

    return-object v0

    .line 648
    :pswitch_70
    const-string/jumbo v0, "RIL_REQUEST_IMS_REGISTRATION_STATE"

    return-object v0

    .line 649
    :pswitch_71
    const-string/jumbo v0, "RIL_REQUEST_IMS_SEND_SMS"

    return-object v0

    .line 650
    :pswitch_72
    const-string/jumbo v0, "RIL_REQUEST_SIM_TRANSMIT_APDU_BASIC"

    return-object v0

    .line 651
    :pswitch_73
    const-string/jumbo v0, "RIL_REQUEST_SIM_OPEN_CHANNEL"

    return-object v0

    .line 652
    :pswitch_74
    const-string/jumbo v0, "RIL_REQUEST_SIM_CLOSE_CHANNEL"

    return-object v0

    .line 653
    :pswitch_75
    const-string/jumbo v0, "RIL_REQUEST_SIM_TRANSMIT_APDU_CHANNEL"

    return-object v0

    .line 654
    :pswitch_76
    const-string/jumbo v0, "RIL_REQUEST_NV_READ_ITEM"

    return-object v0

    .line 655
    :pswitch_77
    const-string/jumbo v0, "RIL_REQUEST_NV_WRITE_ITEM"

    return-object v0

    .line 656
    :pswitch_78
    const-string/jumbo v0, "RIL_REQUEST_NV_WRITE_CDMA_PRL"

    return-object v0

    .line 657
    :pswitch_79
    const-string/jumbo v0, "RIL_REQUEST_NV_RESET_CONFIG"

    return-object v0

    .line 658
    :pswitch_7a
    const-string/jumbo v0, "RIL_REQUEST_SET_UICC_SUBSCRIPTION"

    return-object v0

    .line 659
    :pswitch_7b
    const-string/jumbo v0, "RIL_REQUEST_ALLOW_DATA"

    return-object v0

    .line 660
    :pswitch_7c
    const-string/jumbo v0, "GET_HARDWARE_CONFIG"

    return-object v0

    .line 661
    :pswitch_7d
    const-string/jumbo v0, "RIL_REQUEST_SHUTDOWN"

    return-object v0

    .line 663
    :pswitch_7e
    const-string/jumbo v0, "RIL_REQUEST_SET_RADIO_CAPABILITY"

    return-object v0

    .line 665
    :pswitch_7f
    const-string/jumbo v0, "RIL_REQUEST_GET_RADIO_CAPABILITY"

    return-object v0

    .line 666
    :pswitch_80
    const-string/jumbo v0, "RIL_REQUEST_SET_3G_CAPABILITY"

    return-object v0

    .line 667
    :pswitch_81
    const-string/jumbo v0, "RIL_REQUEST_START_LCE"

    return-object v0

    .line 668
    :pswitch_82
    const-string/jumbo v0, "RIL_REQUEST_STOP_LCE"

    return-object v0

    .line 669
    :pswitch_83
    const-string/jumbo v0, "RIL_REQUEST_PULL_LCEDATA"

    return-object v0

    .line 670
    :pswitch_84
    const-string/jumbo v0, "RIL_REQUEST_GET_ACTIVITY_INFO"

    return-object v0

    .line 536
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_22
        :pswitch_23
        :pswitch_24
        :pswitch_25
        :pswitch_26
        :pswitch_27
        :pswitch_28
        :pswitch_29
        :pswitch_2a
        :pswitch_2b
        :pswitch_2c
        :pswitch_2d
        :pswitch_2e
        :pswitch_2f
        :pswitch_30
        :pswitch_31
        :pswitch_32
        :pswitch_33
        :pswitch_34
        :pswitch_35
        :pswitch_36
        :pswitch_37
        :pswitch_38
        :pswitch_39
        :pswitch_3a
        :pswitch_3b
        :pswitch_3c
        :pswitch_3d
        :pswitch_3e
        :pswitch_3f
        :pswitch_40
        :pswitch_41
        :pswitch_42
        :pswitch_43
        :pswitch_44
        :pswitch_45
        :pswitch_46
        :pswitch_47
        :pswitch_48
        :pswitch_49
        :pswitch_4a
        :pswitch_4b
        :pswitch_4c
        :pswitch_4d
        :pswitch_4e
        :pswitch_4f
        :pswitch_50
        :pswitch_51
        :pswitch_52
        :pswitch_53
        :pswitch_54
        :pswitch_55
        :pswitch_5d
        :pswitch_56
        :pswitch_57
        :pswitch_58
        :pswitch_59
        :pswitch_5c
        :pswitch_5a
        :pswitch_5b
        :pswitch_5e
        :pswitch_5f
        :pswitch_60
        :pswitch_61
        :pswitch_62
        :pswitch_65
        :pswitch_63
        :pswitch_64
        :pswitch_66
        :pswitch_67
        :pswitch_68
        :pswitch_69
        :pswitch_6a
        :pswitch_6b
        :pswitch_6c
        :pswitch_6d
        :pswitch_6e
        :pswitch_6f
        :pswitch_70
        :pswitch_71
        :pswitch_72
        :pswitch_73
        :pswitch_74
        :pswitch_75
        :pswitch_76
        :pswitch_77
        :pswitch_78
        :pswitch_79
        :pswitch_7c
        :pswitch_0
        :pswitch_7a
        :pswitch_7b
        :pswitch_0
        :pswitch_0
        :pswitch_80
        :pswitch_7d
        :pswitch_7f
        :pswitch_7e
        :pswitch_81
        :pswitch_82
        :pswitch_83
        :pswitch_84
    .end packed-switch
.end method


# virtual methods
.method protected createRILReceiver()Lcom/android/internal/telephony/RIL$RILReceiver;
    .locals 1

    .prologue
    .line 106
    new-instance v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;

    invoke-direct {v0, p0}, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;-><init>(Lcom/android/internal/telephony/SproutRIL;)V

    return-object v0
.end method

.method public get3gSimId()I
    .locals 2

    .prologue
    .line 726
    const-string/jumbo v0, "gsm.3gswitch"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getHardwareConfig(Landroid/os/Message;)V
    .locals 3
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    .line 678
    const/16 v1, 0x7a

    invoke-static {v1, p1}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 680
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/SproutRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SproutRIL;->riljLog(Ljava/lang/String;)V

    .line 682
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SproutRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 677
    return-void
.end method

.method protected processSolicited(Landroid/os/Parcel;)Lcom/android/internal/telephony/RILRequest;
    .locals 10
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v9, 0x0

    .line 275
    const/4 v1, 0x0

    .line 277
    .local v1, "found":Z
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 278
    .local v4, "serial":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 282
    .local v0, "error":I
    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/SproutRIL;->findAndRemoveRequestFromList(I)Lcom/android/internal/telephony/RILRequest;

    move-result-object v3

    .line 284
    .local v3, "rr":Lcom/android/internal/telephony/RILRequest;
    if-nez v3, :cond_0

    .line 285
    const-string/jumbo v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Unexpected solicited response! sn: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 286
    const-string/jumbo v8, " error: "

    .line 285
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    return-object v9

    .line 290
    :cond_0
    const/4 v2, 0x0

    .line 292
    .local v2, "ret":Ljava/lang/Object;
    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v6

    if-lez v6, :cond_3

    .line 294
    :cond_1
    :try_start_0
    iget v6, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    packed-switch v6, :pswitch_data_0

    .line 443
    :pswitch_0
    new-instance v6, Ljava/lang/RuntimeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Unrecognized solicited response: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 445
    :catch_0
    move-exception v5

    .line 448
    .local v5, "tr":Ljava/lang/Throwable;
    const-string/jumbo v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "< "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 449
    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v8}, Lcom/android/internal/telephony/SproutRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v8

    .line 448
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 450
    const-string/jumbo v8, " exception, possible invalid RIL response"

    .line 448
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v5}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 452
    iget-object v6, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v6, :cond_2

    .line 453
    iget-object v6, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v6, v9, v5}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 454
    iget-object v6, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v6}, Landroid/os/Message;->sendToTarget()V

    .line 456
    :cond_2
    return-object v3

    .line 300
    .end local v5    # "tr":Ljava/lang/Throwable;
    :pswitch_1
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseIccCardStatus(Landroid/os/Parcel;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .line 460
    .end local v2    # "ret":Ljava/lang/Object;
    :cond_3
    :goto_0
    iget v6, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v7, 0x81

    if-ne v6, v7, :cond_4

    .line 463
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Response to RIL_REQUEST_SHUTDOWN received. Error is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 464
    const-string/jumbo v7, " Setting Radio State to Unavailable regardless of error."

    .line 463
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SproutRIL;->riljLog(Ljava/lang/String;)V

    .line 465
    sget-object v6, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_UNAVAILABLE:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SproutRIL;->setRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    .line 471
    :cond_4
    iget v6, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    packed-switch v6, :pswitch_data_1

    .line 484
    :cond_5
    :goto_1
    :pswitch_2
    if-eqz v0, :cond_7

    .line 485
    iget v6, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    sparse-switch v6, :sswitch_data_0

    .line 514
    :cond_6
    :goto_2
    if-eqz v0, :cond_7

    invoke-virtual {v3, v0, v2}, Lcom/android/internal/telephony/RILRequest;->onError(ILjava/lang/Object;)V

    .line 516
    :cond_7
    if-nez v0, :cond_8

    .line 518
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "< "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v7}, Lcom/android/internal/telephony/SproutRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 519
    const-string/jumbo v7, " "

    .line 518
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 519
    iget v7, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v7, v2}, Lcom/android/internal/telephony/SproutRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 518
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SproutRIL;->riljLog(Ljava/lang/String;)V

    .line 521
    iget-object v6, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v6, :cond_8

    .line 522
    iget-object v6, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v6, v2, v9}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 523
    iget-object v6, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v6}, Landroid/os/Message;->sendToTarget()V

    .line 526
    :cond_8
    return-object v3

    .line 301
    .restart local v2    # "ret":Ljava/lang/Object;
    :pswitch_3
    :try_start_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 302
    :pswitch_4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 303
    :pswitch_5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 304
    :pswitch_6
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 305
    :pswitch_7
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 306
    :pswitch_8
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 307
    :pswitch_9
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 308
    :pswitch_a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 309
    :pswitch_b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 310
    :pswitch_c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 311
    :pswitch_d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 312
    :pswitch_e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 314
    :pswitch_f
    iget-object v6, p0, Lcom/android/internal/telephony/SproutRIL;->mTestingEmergencyCall:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 315
    iget-object v6, p0, Lcom/android/internal/telephony/SproutRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    if-eqz v6, :cond_9

    .line 316
    const-string/jumbo v6, "testing emergency call, notify ECM Registrants"

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SproutRIL;->riljLog(Ljava/lang/String;)V

    .line 317
    iget-object v6, p0, Lcom/android/internal/telephony/SproutRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    invoke-virtual {v6}, Landroid/os/Registrant;->notifyRegistrant()V

    .line 320
    :cond_9
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 323
    :pswitch_10
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 324
    :pswitch_11
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 325
    :pswitch_12
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 326
    :pswitch_13
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseFailCause(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 327
    :pswitch_14
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 328
    :pswitch_15
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 329
    :pswitch_16
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 330
    :pswitch_17
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 331
    :pswitch_18
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 332
    :pswitch_19
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 333
    :pswitch_1a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 334
    :pswitch_1b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 335
    :pswitch_1c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseSetupDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 336
    :pswitch_1d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 337
    :pswitch_1e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 338
    :pswitch_1f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 339
    :pswitch_20
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 340
    :pswitch_21
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 341
    :pswitch_22
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseCallForward(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 342
    :pswitch_23
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 343
    :pswitch_24
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 344
    :pswitch_25
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 345
    :pswitch_26
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 346
    :pswitch_27
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 347
    :pswitch_28
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 348
    :pswitch_29
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 349
    :pswitch_2a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 350
    :pswitch_2b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 351
    :pswitch_2c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 352
    :pswitch_2d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 353
    :pswitch_2e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 354
    :pswitch_2f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 355
    :pswitch_30
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 356
    :pswitch_31
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseOperatorInfos(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 357
    :pswitch_32
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 358
    :pswitch_33
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 359
    :pswitch_34
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 360
    :pswitch_35
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 361
    :pswitch_36
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 362
    :pswitch_37
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 363
    :pswitch_38
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 364
    :pswitch_39
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 365
    :pswitch_3a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseDataCallList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 366
    :pswitch_3b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 367
    :pswitch_3c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseRaw(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 368
    :pswitch_3d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 369
    :pswitch_3e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 370
    :pswitch_3f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 371
    :pswitch_40
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 372
    :pswitch_41
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 373
    :pswitch_42
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 374
    :pswitch_43
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 375
    :pswitch_44
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 376
    :pswitch_45
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 377
    :pswitch_46
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 378
    :pswitch_47
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 379
    :pswitch_48
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 380
    :pswitch_49
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 381
    :pswitch_4a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 382
    :pswitch_4b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseGetPreferredNetworkType(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 383
    :pswitch_4c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseCellList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 384
    :pswitch_4d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 385
    :pswitch_4e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 386
    :pswitch_4f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 387
    :pswitch_50
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 388
    :pswitch_51
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 389
    :pswitch_52
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 390
    :pswitch_53
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 391
    :pswitch_54
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 392
    :pswitch_55
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 393
    :pswitch_56
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 394
    :pswitch_57
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 395
    :pswitch_58
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 396
    :pswitch_59
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseGmsBroadcastConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 397
    :pswitch_5a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 398
    :pswitch_5b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 399
    :pswitch_5c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseCdmaBroadcastConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 400
    :pswitch_5d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 401
    :pswitch_5e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 402
    :pswitch_5f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 403
    :pswitch_60
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 404
    :pswitch_61
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 405
    :pswitch_62
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 406
    :pswitch_63
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 407
    :pswitch_64
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 408
    :pswitch_65
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 409
    :pswitch_66
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 410
    :pswitch_67
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 411
    :pswitch_68
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 412
    :pswitch_69
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 413
    :pswitch_6a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 414
    :pswitch_6b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 415
    :pswitch_6c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 416
    :pswitch_6d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 417
    :pswitch_6e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseCellInfoList(Landroid/os/Parcel;)Ljava/util/ArrayList;

    move-result-object v2

    goto/16 :goto_0

    .line 418
    :pswitch_6f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 419
    :pswitch_70
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 420
    :pswitch_71
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 421
    :pswitch_72
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 422
    :pswitch_73
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 423
    :pswitch_74
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 424
    :pswitch_75
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 425
    :pswitch_76
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 426
    :pswitch_77
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 427
    :pswitch_78
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 428
    :pswitch_79
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 429
    :pswitch_7a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 430
    :pswitch_7b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 431
    :pswitch_7c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 432
    :pswitch_7d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 433
    :pswitch_7e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 434
    :pswitch_7f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseHardwareConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 435
    :pswitch_80
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 436
    :pswitch_81
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseRadioCapability(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 437
    :pswitch_82
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseRadioCapability(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 438
    :pswitch_83
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseLceStatus(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 439
    :pswitch_84
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseLceStatus(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 440
    :pswitch_85
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseLceData(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_0

    .line 441
    :pswitch_86
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SproutRIL;->responseActivityData(Landroid/os/Parcel;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v2

    goto/16 :goto_0

    .line 474
    .end local v2    # "ret":Ljava/lang/Object;
    :pswitch_87
    iget-object v6, p0, Lcom/android/internal/telephony/SproutRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    if-eqz v6, :cond_5

    .line 476
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "ON enter sim puk fakeSimStatusChanged: reg count="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 477
    iget-object v7, p0, Lcom/android/internal/telephony/SproutRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v7}, Landroid/os/RegistrantList;->size()I

    move-result v7

    .line 476
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SproutRIL;->riljLog(Ljava/lang/String;)V

    .line 479
    iget-object v6, p0, Lcom/android/internal/telephony/SproutRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v6}, Landroid/os/RegistrantList;->notifyRegistrants()V

    goto/16 :goto_1

    .line 491
    :sswitch_0
    iget-object v6, p0, Lcom/android/internal/telephony/SproutRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    if-eqz v6, :cond_6

    .line 493
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "ON some errors fakeSimStatusChanged: reg count="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 494
    iget-object v7, p0, Lcom/android/internal/telephony/SproutRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v7}, Landroid/os/RegistrantList;->size()I

    move-result v7

    .line 493
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SproutRIL;->riljLog(Ljava/lang/String;)V

    .line 496
    iget-object v6, p0, Lcom/android/internal/telephony/SproutRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v6}, Landroid/os/RegistrantList;->notifyRegistrants()V

    goto/16 :goto_2

    .line 503
    :sswitch_1
    const/4 v6, 0x6

    if-eq v6, v0, :cond_a

    .line 504
    const/4 v6, 0x2

    if-ne v6, v0, :cond_6

    .line 507
    :cond_a
    invoke-virtual {p0}, Lcom/android/internal/telephony/SproutRIL;->makeStaticRadioCapability()Lcom/android/internal/telephony/RadioCapability;

    move-result-object v2

    .line 508
    .restart local v2    # "ret":Ljava/lang/Object;
    const/4 v0, 0x0

    goto/16 :goto_2

    .line 294
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_22
        :pswitch_23
        :pswitch_24
        :pswitch_25
        :pswitch_26
        :pswitch_27
        :pswitch_28
        :pswitch_29
        :pswitch_2a
        :pswitch_2b
        :pswitch_2c
        :pswitch_2d
        :pswitch_2e
        :pswitch_2f
        :pswitch_30
        :pswitch_31
        :pswitch_32
        :pswitch_33
        :pswitch_34
        :pswitch_35
        :pswitch_36
        :pswitch_37
        :pswitch_38
        :pswitch_39
        :pswitch_3a
        :pswitch_3b
        :pswitch_3c
        :pswitch_3d
        :pswitch_3e
        :pswitch_3f
        :pswitch_40
        :pswitch_41
        :pswitch_42
        :pswitch_43
        :pswitch_44
        :pswitch_45
        :pswitch_46
        :pswitch_47
        :pswitch_48
        :pswitch_49
        :pswitch_4a
        :pswitch_4b
        :pswitch_4c
        :pswitch_4d
        :pswitch_4e
        :pswitch_4f
        :pswitch_50
        :pswitch_51
        :pswitch_52
        :pswitch_53
        :pswitch_54
        :pswitch_55
        :pswitch_56
        :pswitch_5f
        :pswitch_57
        :pswitch_58
        :pswitch_59
        :pswitch_5a
        :pswitch_5b
        :pswitch_5c
        :pswitch_5d
        :pswitch_5e
        :pswitch_60
        :pswitch_61
        :pswitch_62
        :pswitch_63
        :pswitch_66
        :pswitch_64
        :pswitch_65
        :pswitch_67
        :pswitch_68
        :pswitch_69
        :pswitch_6a
        :pswitch_6b
        :pswitch_6c
        :pswitch_6d
        :pswitch_6e
        :pswitch_6f
        :pswitch_70
        :pswitch_71
        :pswitch_72
        :pswitch_73
        :pswitch_74
        :pswitch_75
        :pswitch_76
        :pswitch_78
        :pswitch_7a
        :pswitch_7b
        :pswitch_7c
        :pswitch_7f
        :pswitch_0
        :pswitch_7d
        :pswitch_7e
        :pswitch_0
        :pswitch_0
        :pswitch_79
        :pswitch_80
        :pswitch_81
        :pswitch_82
        :pswitch_83
        :pswitch_84
        :pswitch_85
        :pswitch_86
        :pswitch_77
    .end packed-switch

    .line 471
    :pswitch_data_1
    .packed-switch 0x3
        :pswitch_87
        :pswitch_2
        :pswitch_87
    .end packed-switch

    .line 485
    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_0
        0x4 -> :sswitch_0
        0x6 -> :sswitch_0
        0x7 -> :sswitch_0
        0x2b -> :sswitch_0
        0x82 -> :sswitch_1
    .end sparse-switch
.end method

.method protected responseFailCause(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 6
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v5, 0x0

    .line 690
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 691
    .local v2, "numInts":I
    new-array v3, v2, [I

    .line 692
    .local v3, "response":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 693
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    aput v4, v3, v1

    .line 692
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 695
    :cond_0
    new-instance v0, Lcom/android/internal/telephony/LastCallFailCause;

    invoke-direct {v0}, Lcom/android/internal/telephony/LastCallFailCause;-><init>()V

    .line 696
    .local v0, "failCause":Lcom/android/internal/telephony/LastCallFailCause;
    aget v4, v3, v5

    iput v4, v0, Lcom/android/internal/telephony/LastCallFailCause;->causeCode:I

    .line 697
    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v4

    if-lez v4, :cond_1

    .line 698
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/LastCallFailCause;->vendorCause:Ljava/lang/String;

    .line 700
    :cond_1
    return-object v0
.end method

.method public setDataAllowed(ZLandroid/os/Message;)V
    .locals 7
    .param p1, "allowed"    # Z
    .param p2, "result"    # Landroid/os/Message;

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x1

    .line 704
    iget-object v4, p0, Lcom/android/internal/telephony/SproutRIL;->mInstanceId:Ljava/lang/Integer;

    if-nez v4, :cond_0

    const/4 v0, 0x0

    .line 705
    .local v0, "currentSimId":I
    :goto_0
    invoke-virtual {p0}, Lcom/android/internal/telephony/SproutRIL;->get3gSimId()I

    move-result v1

    .line 706
    .local v1, "m3gSimId":I
    add-int/lit8 v4, v1, -0x1

    if-eq v4, v0, :cond_1

    .line 707
    const/16 v4, 0x80

    invoke-static {v4, v6}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v2

    .line 708
    .local v2, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v4, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v4, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 709
    iget-object v4, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {v4, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 710
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/SproutRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 711
    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SproutRIL;->resetRadio(Landroid/os/Message;)V

    .line 717
    .end local v2    # "rr":Lcom/android/internal/telephony/RILRequest;
    :goto_1
    const/16 v4, 0x7d

    invoke-static {v4, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v2

    .line 718
    .restart local v2    # "rr":Lcom/android/internal/telephony/RILRequest;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v5}, Lcom/android/internal/telephony/SproutRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 719
    const-string/jumbo v5, " "

    .line 718
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/SproutRIL;->riljLog(Ljava/lang/String;)V

    .line 720
    iget-object v4, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v4, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 721
    iget-object v4, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    if-eqz p1, :cond_2

    :goto_2
    invoke-virtual {v4, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 722
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/SproutRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 703
    return-void

    .line 704
    .end local v0    # "currentSimId":I
    .end local v1    # "m3gSimId":I
    .end local v2    # "rr":Lcom/android/internal/telephony/RILRequest;
    :cond_0
    iget-object v4, p0, Lcom/android/internal/telephony/SproutRIL;->mInstanceId:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .restart local v0    # "currentSimId":I
    goto :goto_0

    .line 714
    .restart local v1    # "m3gSimId":I
    :cond_1
    const-string/jumbo v4, "RILJ"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Not setting data subscription on same SIM, requested="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 715
    add-int/lit8 v6, v0, 0x1

    .line 714
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 715
    const-string/jumbo v6, " current="

    .line 714
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 721
    .restart local v2    # "rr":Lcom/android/internal/telephony/RILRequest;
    :cond_2
    const/4 v3, 0x0

    goto :goto_2
.end method
