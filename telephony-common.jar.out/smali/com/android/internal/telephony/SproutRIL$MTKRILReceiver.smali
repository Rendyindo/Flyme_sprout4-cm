.class public Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;
.super Lcom/android/internal/telephony/RIL$RILReceiver;
.source "SproutRIL.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/SproutRIL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "MTKRILReceiver"
.end annotation


# instance fields
.field buffer:[B

.field final synthetic this$0:Lcom/android/internal/telephony/SproutRIL;


# direct methods
.method protected constructor <init>(Lcom/android/internal/telephony/SproutRIL;)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/internal/telephony/SproutRIL;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    invoke-direct {p0, p1}, Lcom/android/internal/telephony/RIL$RILReceiver;-><init>(Lcom/android/internal/telephony/RIL;)V

    .line 113
    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->buffer:[B

    .line 112
    return-void
.end method


# virtual methods
.method public run()V
    .locals 24

    .prologue
    .line 119
    const/4 v15, 0x0

    .line 120
    .local v15, "retryCount":I
    const-string/jumbo v16, "rild"

    .line 123
    .local v16, "rilSocket":Ljava/lang/String;
    :goto_0
    const/16 v17, 0x0

    .line 126
    .local v17, "s":Landroid/net/LocalSocket;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v21, v0

    if-eqz v21, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v21

    if-nez v21, :cond_5

    .line 127
    :cond_0
    sget-object v21, Lcom/android/internal/telephony/SproutRIL;->SOCKET_NAME_RIL:[Ljava/lang/String;

    const/16 v22, 0x0

    aget-object v16, v21, v22

    .line 134
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v21, v0

    if-eqz v21, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v21

    if-nez v21, :cond_6

    .line 135
    :cond_1
    const/4 v4, 0x0

    .line 141
    .local v4, "currentSim":I
    :goto_2
    const/4 v13, 0x0

    .line 142
    .local v13, "m3GsimId":I
    const-string/jumbo v21, "gsm.3gswitch"

    const/16 v22, 0x0

    invoke-static/range {v21 .. v22}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v13

    .line 143
    if-lez v13, :cond_7

    const/16 v21, 0x2

    move/from16 v0, v21

    if-gt v13, v0, :cond_7

    .line 144
    add-int/lit8 v13, v13, -0x1

    .line 149
    :goto_3
    const/16 v21, 0x1

    move/from16 v0, v21

    if-lt v13, v0, :cond_3

    .line 150
    if-nez v4, :cond_8

    .line 151
    sget-object v21, Lcom/android/internal/telephony/SproutRIL;->SOCKET_NAME_RIL:[Ljava/lang/String;

    aget-object v16, v21, v13

    .line 156
    :cond_2
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "Capability switched, swap sockets ["

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, ", "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/android/internal/telephony/SproutRIL;->riljLog(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    .line 160
    :cond_3
    :try_start_1
    new-instance v18, Landroid/net/LocalSocket;

    invoke-direct/range {v18 .. v18}, Landroid/net/LocalSocket;-><init>()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    .line 161
    .end local v17    # "s":Landroid/net/LocalSocket;
    .local v18, "s":Landroid/net/LocalSocket;
    :try_start_2
    new-instance v11, Landroid/net/LocalSocketAddress;

    .line 162
    sget-object v21, Landroid/net/LocalSocketAddress$Namespace;->RESERVED:Landroid/net/LocalSocketAddress$Namespace;

    .line 161
    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-direct {v11, v0, v1}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;Landroid/net/LocalSocketAddress$Namespace;)V

    .line 163
    .local v11, "l":Landroid/net/LocalSocketAddress;
    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_a
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_5

    .line 196
    const/4 v15, 0x0

    .line 198
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/android/internal/telephony/SproutRIL;->mSocket:Landroid/net/LocalSocket;

    .line 199
    const-string/jumbo v21, "RILJ"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "Connected to \'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, "\' socket"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    const-string/jumbo v22, "qcomdsds"

    invoke-virtual/range {v21 .. v22}, Lcom/android/internal/telephony/SproutRIL;->needsOldRilFeature(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_4

    .line 203
    const-string/jumbo v19, "SUB1"

    .line 204
    .local v19, "str":Ljava/lang/String;
    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->getBytes()[B
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_5

    move-result-object v5

    .line 206
    .local v5, "data":[B
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL;->mSocket:Landroid/net/LocalSocket;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Ljava/io/OutputStream;->write([B)V

    .line 207
    const-string/jumbo v21, "RILJ"

    const-string/jumbo v22, "Data sent!!"

    invoke-static/range {v21 .. v22}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_5

    .line 215
    .end local v5    # "data":[B
    .end local v19    # "str":Ljava/lang/String;
    :cond_4
    :goto_5
    const/4 v12, 0x0

    .line 217
    .local v12, "length":I
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL;->mSocket:Landroid/net/LocalSocket;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    .line 222
    .local v10, "is":Ljava/io/InputStream;
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->buffer:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-static {v10, v0}, Lcom/android/internal/telephony/SproutRIL;->-wrap0(Ljava/io/InputStream;[B)I
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_8

    move-result v12

    .line 224
    if-gez v12, :cond_c

    .line 246
    .end local v10    # "is":Ljava/io/InputStream;
    :goto_7
    :try_start_6
    const-string/jumbo v21, "RILJ"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "Disconnected from \'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 247
    const-string/jumbo v23, "\' socket"

    .line 246
    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    sget-object v22, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_UNAVAILABLE:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    invoke-virtual/range {v21 .. v22}, Lcom/android/internal/telephony/SproutRIL;->setRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_5

    .line 252
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL;->mSocket:Landroid/net/LocalSocket;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/net/LocalSocket;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_9
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_5

    .line 256
    :goto_8
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/android/internal/telephony/SproutRIL;->mSocket:Landroid/net/LocalSocket;

    .line 257
    invoke-static {}, Lcom/android/internal/telephony/RILRequest;->resetSerial()V

    .line 260
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    const/16 v23, 0x0

    invoke-virtual/range {v21 .. v23}, Lcom/android/internal/telephony/SproutRIL;->clearRequestList(IZ)V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_5

    move-object/from16 v17, v18

    .end local v18    # "s":Landroid/net/LocalSocket;
    .local v17, "s":Landroid/net/LocalSocket;
    goto/16 :goto_0

    .line 129
    .end local v4    # "currentSim":I
    .end local v11    # "l":Landroid/net/LocalSocketAddress;
    .end local v12    # "length":I
    .end local v13    # "m3GsimId":I
    .local v17, "s":Landroid/net/LocalSocket;
    :cond_5
    :try_start_9
    sget-object v21, Lcom/android/internal/telephony/SproutRIL;->SOCKET_NAME_RIL:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Integer;->intValue()I

    move-result v22

    aget-object v16, v21, v22

    goto/16 :goto_1

    .line 137
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .restart local v4    # "currentSim":I
    goto/16 :goto_2

    .line 146
    .restart local v13    # "m3GsimId":I
    :cond_7
    const/4 v13, 0x0

    goto/16 :goto_3

    .line 153
    :cond_8
    if-ne v4, v13, :cond_2

    .line 154
    sget-object v21, Lcom/android/internal/telephony/SproutRIL;->SOCKET_NAME_RIL:[Ljava/lang/String;

    const/16 v22, 0x0

    aget-object v16, v21, v22
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_2

    goto/16 :goto_4

    .line 164
    :catch_0
    move-exception v7

    .line 166
    .end local v17    # "s":Landroid/net/LocalSocket;
    .local v7, "ex":Ljava/io/IOException;
    :goto_9
    if-eqz v17, :cond_9

    .line 167
    :try_start_a
    invoke-virtual/range {v17 .. v17}, Landroid/net/LocalSocket;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_2

    .line 176
    :cond_9
    :goto_a
    const/16 v21, 0x8

    move/from16 v0, v21

    if-ne v15, v0, :cond_b

    .line 177
    :try_start_b
    const-string/jumbo v21, "RILJ"

    .line 178
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "Couldn\'t find \'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 179
    const-string/jumbo v23, "\' socket after "

    .line 178
    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 180
    const-string/jumbo v23, " times, continuing to retry silently"

    .line 178
    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 177
    invoke-static/range {v21 .. v22}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_2

    .line 188
    :cond_a
    :goto_b
    const-wide/16 v22, 0xfa0

    :try_start_c
    invoke-static/range {v22 .. v23}, Ljava/lang/Thread;->sleep(J)V
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_2

    .line 192
    :goto_c
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_0

    .line 169
    :catch_1
    move-exception v8

    .local v8, "ex2":Ljava/io/IOException;
    goto :goto_a

    .line 181
    .end local v8    # "ex2":Ljava/io/IOException;
    :cond_b
    if-lez v15, :cond_a

    const/16 v21, 0x8

    move/from16 v0, v21

    if-ge v15, v0, :cond_a

    .line 182
    :try_start_d
    const-string/jumbo v21, "RILJ"

    .line 183
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "Couldn\'t find \'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 184
    const-string/jumbo v23, "\' socket; retrying after timeout"

    .line 183
    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 182
    invoke-static/range {v21 .. v22}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_2

    goto :goto_b

    .line 261
    .end local v4    # "currentSim":I
    .end local v7    # "ex":Ljava/io/IOException;
    .end local v13    # "m3GsimId":I
    :catch_2
    move-exception v20

    .line 262
    .local v20, "tr":Ljava/lang/Throwable;
    :goto_d
    const-string/jumbo v21, "RILJ"

    const-string/jumbo v22, "Uncaught exception"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 266
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    const/16 v22, -0x1

    invoke-virtual/range {v21 .. v22}, Lcom/android/internal/telephony/SproutRIL;->notifyRegistrantsRilConnectionChanged(I)V

    .line 118
    return-void

    .line 189
    .end local v20    # "tr":Ljava/lang/Throwable;
    .restart local v4    # "currentSim":I
    .restart local v7    # "ex":Ljava/io/IOException;
    .restart local v13    # "m3GsimId":I
    :catch_3
    move-exception v6

    .local v6, "er":Ljava/lang/InterruptedException;
    goto :goto_c

    .line 210
    .end local v6    # "er":Ljava/lang/InterruptedException;
    .end local v7    # "ex":Ljava/io/IOException;
    .restart local v5    # "data":[B
    .restart local v11    # "l":Landroid/net/LocalSocketAddress;
    .restart local v18    # "s":Landroid/net/LocalSocket;
    .restart local v19    # "str":Ljava/lang/String;
    :catch_4
    move-exception v9

    .line 211
    .local v9, "exc":Ljava/lang/RuntimeException;
    :try_start_e
    const-string/jumbo v21, "RILJ"

    const-string/jumbo v22, "Uncaught exception "

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v9}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_5

    .line 261
    .end local v5    # "data":[B
    .end local v9    # "exc":Ljava/lang/RuntimeException;
    .end local v11    # "l":Landroid/net/LocalSocketAddress;
    .end local v19    # "str":Ljava/lang/String;
    :catch_5
    move-exception v20

    .restart local v20    # "tr":Ljava/lang/Throwable;
    move-object/from16 v17, v18

    .end local v18    # "s":Landroid/net/LocalSocket;
    .local v17, "s":Landroid/net/LocalSocket;
    goto :goto_d

    .line 208
    .end local v17    # "s":Landroid/net/LocalSocket;
    .end local v20    # "tr":Ljava/lang/Throwable;
    .restart local v5    # "data":[B
    .restart local v11    # "l":Landroid/net/LocalSocketAddress;
    .restart local v18    # "s":Landroid/net/LocalSocket;
    .restart local v19    # "str":Ljava/lang/String;
    :catch_6
    move-exception v7

    .line 209
    .restart local v7    # "ex":Ljava/io/IOException;
    const-string/jumbo v21, "RILJ"

    const-string/jumbo v22, "IOException"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v7}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_5

    goto/16 :goto_5

    .line 229
    .end local v5    # "data":[B
    .end local v7    # "ex":Ljava/io/IOException;
    .end local v19    # "str":Ljava/lang/String;
    .restart local v10    # "is":Ljava/io/InputStream;
    .restart local v12    # "length":I
    :cond_c
    :try_start_f
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v14

    .line 230
    .local v14, "p":Landroid/os/Parcel;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->buffer:[B

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v14, v0, v1, v12}, Landroid/os/Parcel;->unmarshall([BII)V

    .line 231
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v14, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SproutRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/SproutRIL;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Lcom/android/internal/telephony/SproutRIL;->processResponse(Landroid/os/Parcel;)V

    .line 236
    invoke-virtual {v14}, Landroid/os/Parcel;->recycle()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_7
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_8

    goto/16 :goto_6

    .line 238
    .end local v10    # "is":Ljava/io/InputStream;
    .end local v14    # "p":Landroid/os/Parcel;
    :catch_7
    move-exception v7

    .line 239
    .restart local v7    # "ex":Ljava/io/IOException;
    :try_start_10
    const-string/jumbo v21, "RILJ"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "\'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, "\' socket closed"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v7}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_7

    .line 241
    .end local v7    # "ex":Ljava/io/IOException;
    :catch_8
    move-exception v20

    .line 242
    .restart local v20    # "tr":Ljava/lang/Throwable;
    const-string/jumbo v21, "RILJ"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "Uncaught exception read length="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 243
    const-string/jumbo v23, "Exception:"

    .line 242
    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 243
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v23

    .line 242
    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_10
    .catch Ljava/lang/Throwable; {:try_start_10 .. :try_end_10} :catch_5

    goto/16 :goto_7

    .line 253
    .end local v20    # "tr":Ljava/lang/Throwable;
    :catch_9
    move-exception v7

    .restart local v7    # "ex":Ljava/io/IOException;
    goto/16 :goto_8

    .line 164
    .end local v7    # "ex":Ljava/io/IOException;
    .end local v11    # "l":Landroid/net/LocalSocketAddress;
    .end local v12    # "length":I
    :catch_a
    move-exception v7

    .restart local v7    # "ex":Ljava/io/IOException;
    move-object/from16 v17, v18

    .end local v18    # "s":Landroid/net/LocalSocket;
    .restart local v17    # "s":Landroid/net/LocalSocket;
    goto/16 :goto_9
.end method
