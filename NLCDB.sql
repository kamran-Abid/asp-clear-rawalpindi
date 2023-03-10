USE [master]
GO
/****** Object:  Database [NLC_DB-16-07-2022]    Script Date: 13/09/2022 11:04:21 ******/
CREATE DATABASE [NLC_DB-16-07-2022]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NLC_DB-16-07-2022', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NLC_DB-16-07-2022.mdf' , SIZE = 30720KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NLC_DB-16-07-2022_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NLC_DB-16-07-2022_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NLC_DB-16-07-2022].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET ARITHABORT OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET  MULTI_USER 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [NLC_DB-16-07-2022]
GO
/****** Object:  DatabaseRole [NLCRole]    Script Date: 13/09/2022 11:04:21 ******/
CREATE ROLE [NLCRole]
GO
/****** Object:  StoredProcedure [dbo].[AddCard]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamid Ashfaq
-- Create date: 12-10-2020
-- Description:	Contractor Insertion
-- =============================================
create PROCEDURE [dbo].[AddCard]
           (@UserID varchar(50)
           ,@User_Type varchar(50)
           ,@CNIC varchar(50)
           ,@RFID varchar(50)
           ,@CreatedBy nvarchar(20)
           ,@CreatedDate datetime
           ,@ModifiedDate datetime)

-- Add the parameters for the stored procedure here
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;
	--EXEC dbo.GetMaxID 'mctx_ContractorInformation','id',@id output
    -- Insert statements for procedure here
INSERT INTO [NLC_DB].[dbo].[tblUserCard]
           ([User_ID]
           ,[User_Type]
           ,[CNIC]
           ,[RFID]
           ,[CreatedBy]
           ,[CreatedDate]
           ,[ModifiedDate])
     VALUES
           (@UserID
           ,@User_Type
           ,@CNIC
           ,@RFID
           ,@CreatedBy
           ,@CreatedDate
           ,@ModifiedDate)
END




GO
/****** Object:  StoredProcedure [dbo].[AddFinger]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamid Ashfaq
-- Create date: 12-10-2020
-- Description:	Contractor Insertion
-- =============================================
CREATE PROCEDURE [dbo].[AddFinger]
           (@UserID varchar(50)
           ,@User_Type varchar(50)
           ,@User_Name varchar(100)
           ,@CNIC nvarchar(50)
           ,@FingerIndex tinyint
           ,@FingerData varbinary(1000)
           ,@Flag tinyint
           ,@Finger_Format int
           ,@CreatedBy nvarchar(20)
           ,@CreatedDate datetime
           ,@ModifiedDate datetime)

-- Add the parameters for the stored procedure here
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;
	--EXEC dbo.GetMaxID 'mctx_ContractorInformation','id',@id output
    -- Insert statements for procedure here
INSERT INTO [NLC_DB].[dbo].[tbl_Finger]
           ([UserID]
           ,[User_Type]
           ,[User_Name]
           ,[CNIC]
           ,[FingerIndex]
           ,[FingerData]
           ,[Flag]
           ,[Finger_Format]
           ,[CreatedBy]
           ,[CreatedDate]
           ,[ModifiedDate])
     VALUES
           (@UserID
           ,@User_Type
           ,@User_Name
           ,@CNIC
           ,@FingerIndex
           ,@FingerData
           ,@Flag
           ,@Finger_Format
           ,@CreatedBy
           ,@CreatedDate
           ,@ModifiedDate)
END




GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Waqas Baig>
-- Create date: <14 jan 2016>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddUser]
@userId bigint,
@username NVARCHAR(200),
@password NVARCHAR(200),
@firstname NVARCHAR(200),
@lastname NVARCHAR(200),
@address NVARCHAR(200)=null,
@city NVARCHAR(200)=null,
@phone NVARCHAR(200)=null,
@mobile NVARCHAR(200)=null,
@email NVARCHAR(200)=null,
@PhoneNo NVARCHAR(200)=null,  
@RoleId INT,
@created_by bigint,
@created_date datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO users(username,password,firstname,lastname,address,city,phone,mobile,email,RoleId,created_by,created_date)
	VALUES(@username,@password,@firstname,@lastname,@address,@city,@PhoneNo,@mobile,@email,@RoleId,@created_by,@created_date)


END




GO
/****** Object:  StoredProcedure [dbo].[AddUserLog]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Waqas Baig>
-- Create date: <14 jan 2016>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddUserLog]
@userId bigint,
@username NVARCHAR(200),
@password NVARCHAR(200),
@firstname NVARCHAR(200),
@lastname NVARCHAR(200),
@address NVARCHAR(200)=null,
@city NVARCHAR(200)=null,
@phone NVARCHAR(200)=null,
@mobile NVARCHAR(200)=null,
@email NVARCHAR(200)=null,
@RoleId INT,
@created_by bigint,
@created_date datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO usersLog(username,password,firstname,lastname,Divission,PhoneNo,mobile,RoleId,created_by,created_date)
	VALUES(@username,@password,@firstname,@lastname,@city,@phone,@mobile,@RoleId,@created_by,@created_date)


END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u WITH ( UPDLOCK, ROWLOCK ), dbo.aspnet_Membership m WITH ( UPDLOCK, ROWLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users WITH (ROWLOCK)
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END




GO
/****** Object:  StoredProcedure [dbo].[Business_Community_Report]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Business_Community_Report]
@F_Name varchar(50) = null,
@Gender varchar(50) = null ,
@Business_catagory varchar (50) = null,
@ClearStatus varchar (50) = null,
@ClearnceLeve varchar (50)= null,
@Date varchar(50) = null
as


select bcd.Id, bcd.Name, bcd.CNIC, vl.User_Type, vl.date, 
    CONVERT(varchar, TIME_OUT,100) as Valid_From,
   convert(varchar, TIME_IN, 100) as Valid_To,
tr.TerminalName, gt.Gate_Name, pa.Site_Name as AccessAllow, cs.ClearanceStatusName as Authorized

from mctx_BusinessCommunityDetail bcd
left join  mctx_visitorlog vl  on  vl.Id = bcd.ID
left join Gender gd on gd.Id = bcd.Gender
left join mctx_BusinessCommunity bc on bc.Id = bcd.BusinessCommunityCategory
left join ClearanceStatus cs on cs.Id = bcd.ClearanceStatus
left join mctx_PersonSiteAllowed pa on pa.Id= bcd.ClearanceLevel
left join mctx_TerminalInfos tr on tr.Terminal_ID = vl.TerminalID
left join mctx_Gates gt on gt.Gate_ID = vl.Gate_Lane

where(((bcd.Name like @F_Name+'%' or bcd.Name is null) and
      (bcd.Gender like @Gender +'%' or bcd.Gender is null) and
	  (bcd.BusinessCommunityCategory like @Business_catagory + '%' or bcd.BusinessCommunityCategory is null )and
	  (bcd.ClearanceLevel like @ClearnceLeve + '%' or bcd.ClearanceLevel is null ) and 
	  (bcd.ClearanceStatus like @ClearStatus +'%' or bcd.ClearanceStatus is null ))and 
	  (vl.DATE >= @Date and vl.DATE<=@Date)
	  and (vl.User_Type='Employee'))




GO
/****** Object:  StoredProcedure [dbo].[BusinessCommunityDetailAdd]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamid Ashfaq
-- Create date: 12-12-2020
-- Description:	Contractor Insertion
-- =============================================
CREATE PROCEDURE [dbo].[BusinessCommunityDetailAdd]
	@Id int out,
	@CNIC varchar(50)=null,
    @Name varchar(50)=null,
    @Gender int=null,
    @DOB varchar(50)=null,
    @address varchar(50)=null,
    @FatherName varchar(50)=null,
    @IdentificationMark varchar(50)=null,
    @BloodGroup varchar(50)=null,
    @ValidityFrom varchar(50)=null,
    @ValidityTo varchar(50)=null,
    @BusinessCommunityCategory int=null,
    @Designation varchar(50)=null,
    @NewPhoto image=null,
    --@CStatus varchar(50)=null,
    @ClearanceLevel int=null,
    @ClearanceStatus int=null,
	@Photo nvarchar(50)=null,
    @created_by nvarchar(50)=null,
    @created_date datetime=null,
    @modified_by nvarchar(50)=null,
    @modified_date datetime=null,
	@authType          nvarchar(50)=null
      
-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	EXEC dbo.GetMaxID 'mctx_BusinessCommunityDetail','Id',@Id output
    -- Insert statements for procedure here
	
	INSERT INTO [dbo].[mctx_BusinessCommunityDetail]
           ([CNIC]
           ,[Name]
           ,[Gender]
           ,[DOB]
           ,[address]
           ,[FatherName]
           ,[IdentificationMark]
           ,[BloodGroup]
           ,[ValidityFrom]
           ,[ValidityTo]
           ,[BusinessCommunityCategory]
           ,[Designation]
           ,[NewPhoto]
           ,[CStatus]
           ,[ClearanceLevel]
           ,[ClearanceStatus]
           ,[Photo]
           ,[created_by]
           ,[created_date]
           ,[modified_by]
           ,[modified_date],AuthenticationType)
     VALUES
           (@CNIC
           ,@Name
           ,@Gender
           ,@DOB
           ,@address
           ,@FatherName
           ,@IdentificationMark
           ,@BloodGroup
           ,@ValidityFrom
           ,@ValidityTo
           ,@BusinessCommunityCategory
           ,@Designation
           ,@NewPhoto
           ,'Active'
           ,@ClearanceLevel
           ,@ClearanceStatus
           ,@Photo
           ,@created_by
           ,@created_date
           ,@modified_by
           ,@modified_date,@authType)
	
	END




GO
/****** Object:  StoredProcedure [dbo].[BusinessCommunityDetailUpdate]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  Hamid Ashfaq      
-- Create date: 11-12-2020      
-- Description: <Description,,>      
-- =============================================      
CREATE PROCEDURE [dbo].[BusinessCommunityDetailUpdate]      
	@Id int out,
	@CNIC varchar(50)=null,
    @Name varchar(50)=null,
    @Gender int=null,
    @DOB varchar(50)=null,
    @address varchar(50)=null,
    @FatherName varchar(50)=null,
    @IdentificationMark varchar(50)=null,
    @BloodGroup varchar(50)=null,
    @ValidityFrom varchar(50)=null,
    @ValidityTo varchar(50)=null,
    @BusinessCommunityCategory int=null,
    @Designation varchar(50)=null,
    @NewPhoto image=null,
    @ClearanceLevel int=null,
    @ClearanceStatus int=null,
	@Photo nvarchar(50)=null,
    @created_by nvarchar(50)=null,
    @created_date datetime=null,
    @modified_by nvarchar(50)=null,
    @modified_date datetime=null  ,
	@authType          nvarchar(50)=null
      
      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
 
 UPDATE [dbo].[mctx_BusinessCommunityDetail]
   SET [CNIC] = @CNIC
      ,[Name] = @Name
      ,[Gender] = @Gender
      ,[DOB] = @DOB
      ,[address] = @address
      ,[FatherName] = @FatherName
      ,[IdentificationMark] = @IdentificationMark
      ,[BloodGroup] = @BloodGroup
      ,[ValidityFrom] = @ValidityFrom
      ,[ValidityTo] = @ValidityTo
      ,[BusinessCommunityCategory] = @BusinessCommunityCategory
      ,[Designation] = @Designation
      ,[NewPhoto] = case when @NewPhoto is null then NewPhoto else @NewPhoto end
      ,[ClearanceLevel] = @ClearanceLevel
      ,[ClearanceStatus] = @ClearanceStatus
      ,[Photo] = case when @Photo is null then Photo else @Photo end
      ,[modified_by] = @modified_by
      ,[modified_date] = @modified_date,
	  AuthenticationType= @authType
 WHERE Id=@id


--UPDATE [dbo].[mctx_ContractorInformation]
--   SET [FirmName] = @FirmName
--      ,[ContractorName] = @ContractorName
--      ,[Gender] = @Gender
--      ,[CNIC] = @CNIC
--      ,[FirmAddress] = @FirmAddress
--      ,[ResidantAddress] = @ResidantAddress
--      ,[MobileNo] = @MobileNo
--      ,[OfficeNumber] = @OfficeNumber
--      ,[IdentificationMark] = @IdentificationMark
--      ,[RankOrAppointment] = @RankOrAppointment
--      ,[Photo] = case when @Photo is null then Photo else @Photo end
--      ,[modified_by] = @modified_by
--      ,[modified_date] = @modified_date
--      ,[CStatus] = 'Active'
--      ,[NewPhoto] = case when @NewPhoto is null then NewPhoto else @NewPhoto end
-- WHERE id=@id
    
END




GO
/****** Object:  StoredProcedure [dbo].[CardColorVMS]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[CardColorVMS]

AS

BEGIN



 SET NOCOUNT ON;  



 Select id, TransportColour from win_TransportColour



END


GO
/****** Object:  StoredProcedure [dbo].[cardIssueReturnReport]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cardIssueReturnReport]
@personType nvarchar(200),
@cardType nvarchar(10),
@startDate nvarchar(10),
@endDate nvarchar(10),
@ctype nvarchar(10)
AS
BEGIN
if(@PersonType='Employee')
begin
select  distinct 'Resident' as catagory,  EM.CardNumber,EM.FirstName +' '+EM.LastName as name ,CR.Type_Name , CONVERT(varchar, cr.created_date, 106)as created_date, EM.CurrAddr,ServiceNo
,'-' as Relation_Name,'-' as [OF],'-' as [name1], EM.Nic as [NIC],[EM].rank as [rank]
from mctx_CardIssueOrReturn_History CR inner join Employee EM on EM.EID=CR.PID 
 where CR.Person_Type='Employee'  and (CR.Type_id=@cardType or @cardType='')
 and( (CR.created_date>= @startDate OR @startDate='') and (CR.created_date<=@endDate OR @endDate=''))
  and EM.CardNumber like ''+@ctype+'%'
end

else if  (@PersonType='EmployeeFamily')        
begin
select  distinct 'Resident family' as catagory, EMF.CardNumber,EMF.FirstName +' '+EMF.LastName as name ,CR.Type_Name ,CONVERT(varchar, cr.created_date, 106)as created_date,EMF.vaddr as CurrAddr,emp.ServiceNo
,rel.Relation_Name,'of' as [OF],emp.FirstName+' '+emp.LastName as [name1],EMF.NIC as [NIC],[emp].rank as [rank]
from mctx_CardIssueOrReturn_History CR 
inner join EmployeeFamily  EMF on EMF.EFID=CR.PID 
inner join Employee emp on emp.EID = EMF.EID
inner join mctx_Relation rel on rel.Relation_ID=EMF.Relation
where CR.Person_Type='Employee Family'  and (CR.Type_id=@cardType or @cardType='')
 and( (CR.created_date>= @startDate OR @startDate='') and (CR.created_date<=@endDate OR @endDate=''))
 and EMF.CardNumber like ''+@ctype+'%'
end


else if  (@PersonType='Servant')      
begin
select  distinct 'Servent' as catagory, sr.CardNumber,sr.FirstName +' '+sr.LastName as name ,CR.Type_Name ,CONVERT(varchar, cr.created_date, 106)as created_date ,Sr.CurrAddr,emp.ServiceNo
,'Servent' as Relation_Name,'of' as [OF],emp.FirstName+' '+emp.LastName as [name1],sr.NIC as [NIC],[emp].rank as [rank]
from mctx_CardIssueOrReturn_History CR 
inner join Servant sr on sr.SID=CR.PID 
inner join Employee emp  on emp.EID = sr.EID
where CR.Person_Type='Servant'  and (CR.Type_id=@cardType or @cardType='')
 and( (CR.created_date>= @startDate OR @startDate='') and (CR.created_date<=@endDate OR @endDate=''))
end


else if  (@PersonType='ServantFamily')      
begin
select distinct 'Servent Family' as catagory, srf.CardNumber,srf.FirstName +' '+srf.LastName as name ,CR.Type_Name ,CONVERT(varchar, cr.created_date, 106)as created_date ,srf.PlaceofWork as CurrAddr ,emp.ServiceNo
,rel.Relation_Name,'of' as [OF],ser.FirstName+' '+ser.LastName as [name1],srf.NIC as [NIC],[emp].rank as [rank]

from mctx_CardIssueOrReturn_History CR 
inner join ServantFamily srf on srf.SFID=CR.PID 
inner join employee emp on emp.EID = srf.EID
inner join Servant ser on ser.SID = srf.SID
inner join mctx_Relation rel on rel.Relation_ID=srf.Relation
where CR.Person_Type='Servant Family'  and (CR.Type_id=@cardType or @cardType='')
 and( (CR.created_date>= @startDate OR @startDate='') and (CR.created_date<=@endDate OR @endDate=''))

end

else if  (@PersonType='NonResident')      
begin
select distinct 'Non Rasident' as catagory, NR.CardNumber,NR.FirstName +' '+NR.LastName as name ,CR.Type_Name ,CONVERT(varchar, cr.created_date, 106)as created_date , NR.CurrAddr , '-' as ServiceNo,'-' as Relation_Name,'-' as [OF],'-' as [name1]
,NR.NIC as [NIC],'-' as [rank]
from mctx_CardIssueOrReturn_History CR inner join NonResident NR on NR.NRID=CR.PID 
where CR.Person_Type='Non Resident'  and (CR.Type_id=@cardType or @cardType='')
 and( (CR.created_date>= @startDate OR @startDate='') and (CR.created_date<=@endDate OR @endDate=''))
 and NR.CardNumber like ''+@ctype+'%'
end


else if (@PersonType='Visitor' )        
begin
select distinct 'Visitor' as catagory, VI.CardNo as CardNumber ,VI.FirstName +' '+VI.LastName as name ,CR.Type_Name ,CONVERT(varchar, cr.created_date, 106)as created_date,VI.Addr  as CurrAddr , '-' as ServiceNo
,'-' as Relation_Name,'-' as [OF],'-' as [name1],VI.NIC as [NIC],'-' as [rank]
from  mctx_CardIssueOrReturn_History CR inner join visitor VI on VI.VID=CR.PID 
where CR.Person_Type='Visitor'  and (CR.Type_id=@cardType or @cardType='')
 and( (CR.created_date>= @startDate OR @startDate='') and (CR.created_date<=@endDate OR @endDate=''))
end 

else 
begin
select 'record not found' as notFound
end

--select * from mctx_CardIssueOrReturn CR inner join visitor VI on VI.VID=CR.PID where (CR.Person_Type='Visitor' or CR.Person_Type='') and CR.Type_Name='Duplicate Card Issue'
END




GO
/****** Object:  StoredProcedure [dbo].[CarMakeVMS]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CardColorVMS







CREATE  PROCEDURE [dbo].[CarMakeVMS]































AS















BEGIN















 SET NOCOUNT ON;  































   Select id, TransportMake from win_TransportMake























	 















END















--SELECT * FROM UVSS_PDI


























GO
/****** Object:  StoredProcedure [dbo].[ContractorAdd]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamid Ashfaq
-- Create date: 12-10-2020
-- Description:	Contractor Insertion
-- =============================================
CREATE PROCEDURE [dbo].[ContractorAdd]
	@id int out,
	@FirmName varchar(50)=null,
	@ContractorName varchar(50)=null,
    @Gender int=null,
    @CNIC varchar(50)=null,
	@FirmAddress varchar(50)=null,
    @ResidantAddress varchar(50)=null,
    @MobileNo varchar(50)=null,
    @OfficeNumber varchar(50)=null,
    @IdentificationMark varchar(50)=null,
    @RankOrAppointment varchar(50)=null,
	@Photo nvarchar(100)=null,
    @created_by bigint,    
	@created_date datetime,
	@ClearanceStatus int=null,
    @ClearanceLevel int=null,
    @ValidFrom date=null,
    @ValidTo date=null,
	@NewPhoto image=null,

	@authType varchar(50)=null


           
-- Add the parameters for the stored procedure here
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	EXEC dbo.GetMaxID 'mctx_ContractorInformation','id',@id output
    -- Insert statements for procedure here
	INSERT INTO [dbo].[mctx_ContractorInformation]
           ([FirmName]
           ,[ContractorName]
           ,[Gender]
           ,[CNIC]
		   ,[FirmAddress]
           ,[ResidantAddress]
           ,[MobileNo]
           ,[OfficeNumber]
           ,[IdentificationMark]
           ,[RankOrAppointment]
		   ,[Photo]
		   ,[created_by]
           ,[created_date]
           ,[CStatus]
           ,[NewPhoto]
		   ,[ValidityFrom]
           ,[ValidityTo]
           ,[ClearanceLevel]
           ,[ClearanceStatus],AuthenticationType)
     VALUES (@FirmName
           ,@ContractorName
           ,@Gender
           ,@CNIC
           ,@ResidantAddress
		   ,@FirmAddress
           ,@MobileNo
           ,@OfficeNumber
           ,@IdentificationMark
           ,@RankOrAppointment
		   ,@Photo
           ,@created_by
		   ,@created_date
		   ,'Active'
           ,@NewPhoto
		   ,@ValidFrom
		   ,@ValidTo
		   ,@ClearanceLevel
		   ,@ClearanceStatus, @authType)
END




GO
/****** Object:  StoredProcedure [dbo].[ContractorLaborAdd]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamid Ashfaq
-- Create date: 12-12-2020
-- Description:	Contractor Insertion
-- =============================================
CREATE PROCEDURE [dbo].[ContractorLaborAdd]
	@id int out,
	@ContractorName nvarchar(50)=null,
	@FirmName nvarchar(50)=null,
    @LaborName nvarchar(50)=null,
    @Gender int=null,
    @CNIC nvarchar(50)=null,
    @IdentificationMark nvarchar(50)=null,
    @Placeofwork nvarchar(50)=null,
    @address varchar(50)=null,
    @MobileNumber varchar(50)=null,
    @Photo nvarchar(50)=null,
    @created_by nvarchar(50)=null,
    @created_date datetime=null,
    @ClearanceStatus int=null,
    @ClearanceLevel int=null,
    @ValidFrom datetime=null,
    @ValidTo datetime=null,
	@AuthType nvarchar(50)=null,
    @NewPhoto image=null
      
-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	EXEC dbo.GetMaxID 'mctx_ContractorLaborInformation','id',@id output
    -- Insert statements for procedure here
	INSERT INTO [dbo].[mctx_ContractorLaborInformation]
           ([ContractorName]
		   ,[FirmName]
           ,[LaborName]
           ,[Gender]
           ,[CNIC]
           ,[IdentificationMark]
           ,[Placeofwork]
           ,[address]
           ,[MobileNumber]
           ,[Photo]
           ,[created_by]
           ,[created_date]
           ,[ClearanceStatus]
           ,[ClearanceLevel]
           ,[ValidFrom]
           ,[ValidTo]
           ,[CStatus]
           ,[NewPhoto],AuthenticationType)
     VALUES
           (@ContractorName
		   ,@FirmName
           ,@LaborName
           ,@Gender
           ,@CNIC
           ,@IdentificationMark
           ,@Placeofwork
           ,@address
           ,@MobileNumber
           ,@Photo
           ,@created_by
           ,@created_date
           ,@ClearanceStatus
           ,@ClearanceLevel
           ,@ValidFrom
           ,@ValidTo
           ,'Active'
           ,@NewPhoto, @AuthType)
	
	
	
	--INSERT INTO [dbo].[mctx_ContractorInformation]
 --          ([FirmName]
 --          ,[ContractorName]
 --          ,[Gender]
 --          ,[CNIC]
	--	   ,[FirmAddress]
 --          ,[ResidantAddress]
 --          ,[MobileNo]
 --          ,[OfficeNumber]
 --          ,[IdentificationMark]
 --          ,[RankOrAppointment]
	--	   ,[Photo]
	--	   ,[created_by]
 --          ,[created_date]
 --          ,[CStatus]
 --          ,[NewPhoto])
 --    VALUES (@FirmName
 --          ,@ContractorName
 --          ,@Gender
 --          ,@CNIC
 --          ,@ResidantAddress
	--	   ,@FirmAddress
 --          ,@MobileNo
 --          ,@OfficeNumber
 --          ,@IdentificationMark
 --          ,@RankOrAppointment
	--	   ,@Photo
 --          ,@created_by
	--	   ,@created_date
	--	   ,'Active'
 --          ,@NewPhoto)
END




GO
/****** Object:  StoredProcedure [dbo].[ContractorLaborUpdate]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  Hamid Ashfaq      
-- Create date: 11-12-2020      
-- Description: <Description,,>      
-- =============================================      
CREATE PROCEDURE [dbo].[ContractorLaborUpdate]      
	@id int out,
	@ContractorName int=null,
	@FirmName nvarchar(50)=null,
    @LaborName nvarchar(50)=null,
    @Gender int=null,
    @CNIC nvarchar(50)=null,
    @IdentificationMark nvarchar(50)=null,
    @Placeofwork nvarchar(50)=null,
    @address varchar(50)=null,
    @MobileNumber varchar(50)=null,
    @Photo nvarchar(50)=null,
    @modified_by nvarchar(50)=null,
    @modified_date datetime=null,
    @ClearanceStatus int=null,
    @ClearanceLevel int=null,
    @ValidFrom datetime=null,
    @ValidTo datetime=null,
	@AuthType nvarchar(50)=null,
    @NewPhoto image=null           
      
      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      

UPDATE [dbo].[mctx_ContractorLaborInformation]
   SET [ContractorName]=@ContractorName
	  ,[FirmName] = @FirmName
      ,[LaborName] = @LaborName
      ,[Gender] = @Gender
      ,[CNIC] = @CNIC
      ,[IdentificationMark] = @IdentificationMark
      ,[Placeofwork] = @Placeofwork
      ,[address] = @address
      ,[MobileNumber] = @MobileNumber
      ,[Photo] = case when @Photo is null then Photo else @Photo end
      ,[modified_by] = @modified_by
      ,[modified_date] = @modified_date
      ,[ClearanceStatus] = @ClearanceStatus
      ,[ClearanceLevel] = @ClearanceLevel
      ,[ValidFrom] = @ValidFrom
      ,[ValidTo] = @ValidTo,
	  AuthenticationType = @AuthType
      ,[NewPhoto] = case when @NewPhoto is null then NewPhoto else @NewPhoto end
 WHERE id=@id

 
--UPDATE [dbo].[mctx_ContractorInformation]
--   SET [FirmName] = @FirmName
--      ,[ContractorName] = @ContractorName
--      ,[Gender] = @Gender
--      ,[CNIC] = @CNIC
--      ,[FirmAddress] = @FirmAddress
--      ,[ResidantAddress] = @ResidantAddress
--      ,[MobileNo] = @MobileNo
--      ,[OfficeNumber] = @OfficeNumber
--      ,[IdentificationMark] = @IdentificationMark
--      ,[RankOrAppointment] = @RankOrAppointment
--      ,[Photo] = case when @Photo is null then Photo else @Photo end
--      ,[modified_by] = @modified_by
--      ,[modified_date] = @modified_date
--      ,[CStatus] = 'Active'
--      ,[NewPhoto] = case when @NewPhoto is null then NewPhoto else @NewPhoto end
-- WHERE id=@id
    
END




GO
/****** Object:  StoredProcedure [dbo].[ContractorUpdate]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  Hamid Ashfaq      
-- Create date: 11-12-2020      
-- Description: <Description,,>      
-- =============================================      
CREATE PROCEDURE [dbo].[ContractorUpdate]      
	@id int out,
	@FirmName varchar(50)=null,
	@ContractorName varchar(50)=null,
    @Gender int=null,
    @CNIC varchar(50)=null,
	@FirmAddress varchar(50)=null,
    @ResidantAddress varchar(50)=null,
    @MobileNo varchar(50)=null,
    @OfficeNumber varchar(50)=null,
    @IdentificationMark varchar(50)=null,
    @RankOrAppointment varchar(50)=null,
	@Photo nvarchar(100)=null,
    @modified_by nvarchar(50),    
	@modified_date datetime,
	@ClearanceStatus int=null,
    @ClearanceLevel int=null,
    @ValidFrom date=null,
    @ValidTo date=null,

    @authType nvarchar(50),  
	@NewPhoto image=null           
      
      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
 
UPDATE [dbo].[mctx_ContractorInformation]
   SET [FirmName] = @FirmName
      ,[ContractorName] = @ContractorName
      ,[Gender] = @Gender
      ,[CNIC] = @CNIC
      ,[FirmAddress] = @FirmAddress
      ,[ResidantAddress] = @ResidantAddress
      ,[MobileNo] = @MobileNo
      ,[OfficeNumber] = @OfficeNumber
      ,[IdentificationMark] = @IdentificationMark
      ,[RankOrAppointment] = @RankOrAppointment
      ,[Photo] = case when @Photo is null then Photo else @Photo end
      ,[modified_by] = @modified_by
      ,[modified_date] = @modified_date
      ,[NewPhoto] = case when @NewPhoto is null then NewPhoto else @NewPhoto end
	  ,[ValidityFrom] = @ValidFrom
      ,[ValidityTo] = @ValidTo
      ,[ClearanceLevel] = @ClearanceLevel
      ,[ClearanceStatus] = @ClearanceStatus,
	 AuthenticationType = @authType
 WHERE id=@id
    
END




GO
/****** Object:  StoredProcedure [dbo].[DeleteFinger]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteFinger] 
	-- Add the parameters for the stored procedure here
	@tblFingerID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	DELETE FROM [tbl_Finger]
      WHERE tblFingerID = @tblFingerID


END




GO
/****** Object:  StoredProcedure [dbo].[Employee_Report]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Employee_Report]

 @CNIC varchar(50) = NULL,
 @FirstName varchar(50) = NULL,
 @Department varchar(50) = NULL,
 @Designation varchar(50) = NULL,
 @FromDate varchar(50)= NULL,
 @ToDate varchar(50)= NULL

 As 



SELECT emp.FirstName as Name,User_Type,CNIC, vl.date, 
     dep.Department_Name as	Department, desi.designation as Designation,
      CONVERT(varchar, TIME_OUT,100) TIME_OUT, 
      convert(varchar, TIME_IN, 100) TIME_IN,emp.Mobile as Mobile ,
     tr.TerminalName , gt.Gate_Name, pa.Site_Name as AccessAllow , cs.ClearanceStatusName as Authorized
  
                 FROM Employee emp   
                 left Join  [dbo].[mctx_visitorlog] vl   on vl.ID = emp.EID  
                 Left Join mctx_Department dep on emp.Department = dep.Department_ID  
                 Left Join HR_Designation desi on emp.Designation = desi.Designation_ID 
				 left join mctx_TerminalInfos tr on vl.TerminalID = tr.Terminal_ID 
				 left join mctx_Gates gt on vl.Gate_Lane = gt.Gate_ID 
				 left join mctx_PersonSiteAllowed pa on emp.ClearanceLevel = pa.ID
				 left join ClearanceStatus cs on emp.ClearanceStatus = cs.id
                  WHERE(((vl.CNIC  LIKE @CNIC + '%' or vl.CNIC  IS NULL ) and (emp.FirstName like @FirstName+ '%' or emp.FirstName IS NULL)
                   and (emp.Department like CAST(@Department AS NVARCHAR) + '%' or emp.Department IS NULL ) and
				 (emp.Designation like  CAST(@Designation AS NVARCHAR) + '%' or emp.Designation IS NULL ))
                   and (vl.date >= @FromDate and vl.date <=@ToDate )AND (vl.User_Type = 'Employee'))




GO
/****** Object:  StoredProcedure [dbo].[EmployeeAdd]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    



-- Author:  <Waqas Baig>    



-- Create date: <25 Jan 2106>    



-- Description: <Description,,>    



-- =============================================  



  



CREATE PROCEDURE [dbo].[EmployeeAdd]  



  



@EID int output,    



@ServiceNo nvarchar(250)=NULL,



@FirstName  nvarchar(250)=NULL, 



@LastName  nvarchar(250)=NULL,  



--@Nic  nvarchar(250)=NULL,  



@NIC  nvarchar(250)=NULL,







@MotherName nvarchar(250)=NULL,



@FatherName  nvarchar(250)=NULL, 



@clearanceStatus  nvarchar(250)=NULL,  



@Section  nvarchar(250)=NULL,  







@BloodGroup nvarchar(250)=NULL,



@Cadre  nvarchar(250)=NULL, 



@ResidentStatus  nvarchar(250)=NULL,  



@CardColor  nvarchar(250)=NULL,  







@Transport nvarchar(250)=NULL,



@SiteAllowed  nvarchar(250)=NULL, 







@EmployeeIdentificationMark  nvarchar(250)=NULL,







@Designation  nvarchar(250)=NULL,  



@Rank_ID int,  







@Department  nvarchar(100)=NULL,  



@CurrAddr  nvarchar(250)=NULL, 







--@Location  nvarchar(250)=NULL, 











@PerAddr  nvarchar(250)=NULL,  



@Mobile  nvarchar(250)=NULL,  



@PhoneHome  nvarchar(250)=NULL,  











@ReleaseDate DATETIME=NULL,  



@PhoneOffice  nvarchar(250)=NULL,  



@Dob  datetime=NULL,  







@Gender  nvarchar(250)=NULL, 

@Remarks nvarchar(250)=NULL,



@authType  nvarchar(250)=NULL ,











@Photo nvarchar(250)=NULL,  



@created_by bigint,



@created_date datetime,  







@NewPhoto image = null







 



AS  



  



BEGIN    



 -- SET NOCOUNT ON added to prevent extra result sets from 



 -- interfering with SELECT statements.  



  



 SET NOCOUNT ON;  



 EXEC dbo.GetMaxID 'Employee','EID',@EID output  



  declare @MaxId as varchar(10)



 --INSERT INTO Employee(EID,ServiceNo,Designation,



 --FirstName,LastName,CurrAddr,PerAddr,Nic,PhoneOffice,  



 --       Mobile,Department,Dob,Photo,created_by,created_date,NewPhoto,



	--	MotherName,FatherName, ClearanceStatus, Section, BloodGroup, Cadre, ResidantStatus, CardColor,Transport, ClearanceLevel,IdentificationMark,ValidUpto,Rank,PhoneHome,



	--	Gender, AuthenticationType,Status)  



    



 --VALUES (@EID,@ServiceNo,@Designation,



 --@FirstName,@LastName,@CurrAddr,@PerAddr,@NIC,@PhoneOffice,



   



 --       @Mobile,@Department,@Dob,@Photo,@created_by,@created_date,@NewPhoto,



	--	@MotherName, @FatherName,@clearanceStatus,@Section,@BloodGroup,@Cadre, @ResidentStatus, @CardColor, @Transport, @SiteAllowed,@EmployeeIdentificationMark ,@ReleaseDate,@Rank_ID,@PhoneHome,



	--	@Gender,@authType,'Active')  



  



 -- set @MaxId = (select MAX(EID) from employee)



 



 INSERT INTO Employee(ServiceNo,Designation,



 FirstName,LastName,CurrAddr,PerAddr,Nic,PhoneOffice,  



        Mobile,Department,Dob,Photo,created_by,created_date,NewPhoto,



		MotherName,FatherName, ClearanceStatus, Section, BloodGroup, Cadre, ResidantStatus, CardColor,Transport, ClearanceLevel,IdentificationMark,ValidUpto,Rank,PhoneHome,



		Gender, Remarks,AuthenticationType,Status)  



    



 VALUES (@ServiceNo,@Designation,



 @FirstName,@LastName,@CurrAddr,@PerAddr,@NIC,@PhoneOffice,



   



        @Mobile,@Department,@Dob,@Photo,@created_by,@created_date,@NewPhoto,



		@MotherName, @FatherName,@clearanceStatus,@Section,@BloodGroup,@Cadre, @ResidentStatus, @CardColor, @Transport, @SiteAllowed,@EmployeeIdentificationMark ,@ReleaseDate,@Rank_ID,@PhoneHome,



		@Gender, @Remarks,@authType,'Active')  



  



  set @MaxId = (select MAX(EID) from employee)



 



  



INSERT INTO [dbo].[EmployeeLog]



           ([Employee_Id],[ServiceNo],[Rank],[ValidUpto],[FirstName],[LastName],[Nic],[Department],[Designation],[Cadre],[Transport],[ClearanceStatus],[ClearanceLevel])



     VALUES



           (@MaxId,@ServiceNo,@Rank_ID ,@ReleaseDate,@FirstName,@LastName,@NIC,@Department,@Designation,@Cadre,@Transport,@clearanceStatus,@SiteAllowed)



    



END













GO
/****** Object:  StoredProcedure [dbo].[EmployeeCardColor]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmployeeCardColor]
AS
BEGIN
select * from CardColor
END




GO
/****** Object:  StoredProcedure [dbo].[EmployeeFamilyAdd]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Waqas Baig>  
-- Create date: <26 Jan 2106>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[EmployeeFamilyAdd]  
@EFID int,   
@EID int,  
--@CardNumber nvarchar(250)=null,  
@FirstName nvarchar(250)=null,  
@LastName nvarchar(250)=null,  
@Relation nvarchar(250)=null,  
@NIC nvarchar(250)=null,  

@vaddr  nvarchar(160)=null,  

@Photo nvarchar(250)=null,  
@created_by bigint,  
@created_date datetime,  

@NewPhoto image = null     ,
@securityClearance nvarchar(20)=null,
@FamilyGender nvarchar(20)=null,
@ClearanceLevel nvarchar(20)=null,
@DOB   nvarchar(20)=null,

@ValidFrom   nvarchar(20)=null,
@ValidTo  nvarchar(20)=null,
@AuthType   nvarchar(20)=null
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 --SET NOCOUNT ON;  
  
  
 --EXEC dbo.GetMaxID 'EmployeeFamily','EFID',@EFID output  
   
 --INSERT INTO EmployeeFamily(EFID,EID,FirstName,LastName,Relation,NIC,Status,_status,address,created_by,created_date,SecurityClearance,DateofBirth,ClearanceLevel,FamilyGender
 --,ValidFrom,ValidTo,AuthenticationType
 
 --)  
 --VALUES (@EFID,@EID,@FirstName,@LastName,@Relation,@NIC,'Active',1,@vaddr,@created_by,@created_date,@securityClearance,@DOB,@ClearanceLevel,@FamilyGender,
 --@ValidFrom , @ValidTo, @AuthType
 --)  
  
  INSERT INTO EmployeeFamily(EID,FirstName,LastName,Relation,NIC,Status,_status,address,created_by,created_date,SecurityClearance,DateofBirth,ClearanceLevel,FamilyGender
 ,ValidFrom,ValidTo,AuthenticationType
 
 )  
 VALUES (@EID,@FirstName,@LastName,@Relation,@NIC,'Active',1,@vaddr,@created_by,@created_date,@securityClearance,@DOB,@ClearanceLevel,@FamilyGender,
 @ValidFrom , @ValidTo, @AuthType
 )  
  
END




GO
/****** Object:  StoredProcedure [dbo].[EmployeeFamilyUpdate]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Waqas Baig>    
-- Create date: <26 Jan 2106>    
-- Description: <Description,,>    
-- =============================================    
CREATE PROCEDURE [dbo].[EmployeeFamilyUpdate]    
@EFID int,     
@EID int,    
@FirstName nvarchar(250)=null,    
@LastName nvarchar(250)=null,    
@Relation nvarchar(250)=null,    
@NIC nvarchar(250)=null,    
  
@vaddr  nvarchar(160)=null,    

@Photo nvarchar(250)=null,    
@modified_by bigint,    
@modified_date datetime,    

@NewPhoto image = null ,
@securityClearance nvarchar(20)=null,
@FamilyGender nvarchar(20)=null,
@ClearanceLevel nvarchar(20)=null,
@DOB   nvarchar(20)=null,

@ValidFrom   nvarchar(20)=null,
@ValidTo  nvarchar(20)=null,
@AuthType   nvarchar(20)=null
    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
 UPDATE EmployeeFamily SET FirstName=@FirstName,LastName=@LastName,Relation=@Relation,NIC=@NIC,Photo=case when @Photo is null then Photo else @Photo end,    
 vaddr=@vaddr,modified_by=@modified_by,modified_date=@modified_date, NewPhoto=case when  @NewPhoto is null then NewPhoto else @NewPhoto end  ,
 SecurityClearance=@securityClearance,DateofBirth=@DOB   ,ClearanceLevel=@ClearanceLevel,FamilyGender=@FamilyGender,
 ValidFrom=@ValidFrom,ValidTo=@ValidTo,AuthenticationType=@AuthType
     
 where EFID=@EFID    
      
END




GO
/****** Object:  StoredProcedure [dbo].[EmployeeSelectIndex]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[EmployeeSelectIndex]
(
@Nic float,
@Designation int,
@Department int


)
As
Begin
select * from employee emp
 left join HR_Designation hd on emp.Designation = hd.Designation_ID
 left join mctx_Department md on emp.Department = md.Department_ID
   where emp.nic = '4230190765233'

   end
GO
/****** Object:  StoredProcedure [dbo].[EmployeeUpdate]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/      

-- =============================================        


-- Author:  <Waqas Baig>        

-- Create date: <25 Jan 2106>        



-- =============================================        

CREATE PROCEDURE [dbo].[EmployeeUpdate]        



@EID int output,    

@ServiceNo nvarchar(250)=NULL,

@FirstName  nvarchar(250)=NULL, 

@LastName  nvarchar(250)=NULL,  

@Nic  nvarchar(250)=NULL,  

@Designation  nvarchar(250)=NULL,  

@Rank_ID int,  

@Department  nvarchar(100)=NULL,  

@CurrAddr  nvarchar(250)=NULL, 

@Location  nvarchar(250)=NULL, 

@PerAddr  nvarchar(250)=NULL,  

@Mobile  nvarchar(250)=NULL,  

@PhoneHome  nvarchar(250)=NULL,  

@ReleaseDate DATETIME=NULL,  

@PhoneOffice  nvarchar(250)=NULL,  

@Dob  datetime=NULL,  

@Photo nvarchar(250)=NULL,  

@modified_by bigint,

@modified_date datetime,  

@NewPhoto image = null  ,

@MotherName nvarchar(250)=NULL,

@FatherName  nvarchar(250)=NULL, 

@clearanceStatus  nvarchar(250)=NULL,  

@Section  nvarchar(250)=NULL,  

@BloodGroup nvarchar(250)=NULL,

@Cadre  nvarchar(250)=NULL, 

@ResidentStatus  nvarchar(250)=NULL,  

@CardColor  nvarchar(250)=NULL,  

@Transport nvarchar(250)=NULL,

@SiteAllowed  nvarchar(250)=NULL, 

@Gender  nvarchar(250)=NULL, 

@Remarks nvarchar(250)=NULL,

@authType  nvarchar(250)=NULL,

@EmployeeIdentificationMark  nvarchar(250)=NULL

AS    

BEGIN    

 -- SET NOCOUNT ON added to prevent extra result sets from        

 -- interfering with SELECT statements.        

 SET NOCOUNT ON;        

 update Employee set ServiceNo=@ServiceNo,[Rank]=@Rank_ID,Designation=@Designation,FirstName=@FirstName,LastName=@LastName,

 CurrAddr=@CurrAddr,PerAddr=@PerAddr,Nic=@Nic,PhoneOffice=@PhoneOffice,PhoneHome=@PhoneHome,Mobile=@Mobile,        

 Department=@Department,Photo=case when @Photo is null then Photo else @Photo end,        

 Dob=@Dob, modified_by=@modified_by,modified_date=@modified_date,      

 NewPhoto=case when @NewPhoto IS null then NewPhoto else @NewPhoto end,

  MotherName=@motherName,FatherName=@FatherName,

  ClearanceStatus=@clearanceStatus, Section=@Section, BloodGroup=@BloodGroup

  ,Cadre=@Cadre, ResidantStatus=@ResidentStatus, CardColor=@CardColor,Transport=@Transport,

  ClearanceLevel=@SiteAllowed,IdentificationMark=@EmployeeIdentificationMark,ValidUpto=@ReleaseDate,Gender=@Gender,Remarks=@Remarks,

 AuthenticationType =@authType

   where EID=@EID 

	INSERT INTO [dbo].[EmployeeLog] ([Employee_Id],[ServiceNo],[Rank],[ValidUpto],[FirstName],[LastName],[Nic],[Department],
	[Designation],[Cadre],[Transport],[ClearanceStatus],[ClearanceLevel])

    VALUES (@EID,@ServiceNo,@Rank_ID ,@ReleaseDate,@FirstName,@LastName,@Nic,@Department,@Designation,@Cadre,@Transport,@clearanceStatus,@SiteAllowed)

END     
GO
/****** Object:  StoredProcedure [dbo].[EmpVMS]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--                  sp_helptext EmpVMS

   -- select EID, Nic, FirstName+'   '+LastName as FullName from Employee order by FullName


   CREATE  PROCEDURE [dbo].[EmpVMS]
   
   AS
   
BEGIN

 SET NOCOUNT ON;  

    select EID, Nic, FirstName+'   '+LastName as FullName from Employee order by FullName


END

GO
/****** Object:  StoredProcedure [dbo].[eTagIssuseReturnReport]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[eTagIssuseReturnReport]
@cnic nvarchar(20),
@vacsID nvarchar(10),
@veh_no nvarchar(10),
@cardType nvarchar(10),
@startDate nvarchar(10),
@endDate nvarchar(10)
AS
BEGIN

select ROW_NUMBER() Over ( Order by VA.Name) As [SN],VA.VACS_ID,VA.VehicleNo,VA.CNIC,IR.Card_For_Year, VA.Name , VA.CNIC,Type_name as [TypeName] ,Person_Type as [persontype], convert(varchar(10),DATE,101) as [ActionDate]  from mctx_VACSCardIssueReturn IR 							
left join mctx_VACS VA on VA.VACS_ID=IR.VACS_ID
where (IR.Type_id=@cardType or @cardType='') and (VA.CNIC=@cnic or @cnic='') 
and (VA.VACS_ID=@vacsID or @vacsID='') and (VA.VehicleNo=@veh_no or @veh_no='')
and( (IR.created_date>= @startDate OR @startDate='') and (IR.created_date<=@endDate OR @endDate=''))
END




GO
/****** Object:  StoredProcedure [dbo].[ExceptionLoggingToDataBase]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ExceptionLoggingToDataBase]  
(  
@ExceptionHeader varchar(max)=null,  
@ExceptionType varchar(100)=null,  
@ExceptionDetails nvarchar(max)=null,  
@DateTime datetime  
)  
as  
begin  
INSERT INTO [dbo].[Tbl_ExceptionLog]
           ([ExceptionHeader]
           ,[ExceptionType]
           ,[ExceptionDetails]
            ,[Logdate])
     VALUES
           (@ExceptionHeader,
           @ExceptionType,
           @ExceptionDetails,
           @DateTime)
End




GO
/****** Object:  StoredProcedure [dbo].[GetAllVisitor]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllVisitor] 



as



select VISITOR_NAME, CNIC, ID, isexpired, emp.ServiceNo from mctx_visitor vis join Employee emp on emp.EID= vis.Employee_ID where TIME_OUT is null order by ID desc




GO
/****** Object:  StoredProcedure [dbo].[GetBlackListingInfo]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
 -- Author:  <Author, Rahan Abbass>  
 -- Create date: <Create Date, 26-05-2016,>  
 -- Description: <Description,  Get Result from the different tables on the basis of CNIC No.,>  
 -- =============================================  
 CREATE PROCEDURE [dbo].[GetBlackListingInfo]  
  @PersonType nvarchar(255)=null  
 AS  
 BEGIN  
  -- SET NOCOUNT ON added to prevent extra result sets from  
  -- interfering with SELECT statements.  
  SET NOCOUNT ON;  
 DECLARE @cnt int;  
  -- cnic, Name, card No, emplyeeType =table Name, owner name  
    
  if (@PersonType='Employee' )    
  begin   
  
SELECT EID as PID, 'EID' as PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'Employee' as tableName,IsNull(CardNumber,' ') as CardNumber
  ,NIC,FirstName+' '+isnull(LastName,'') as Name, 'Self' as OwnerName ,Nic as ownerNic,[Status] as UserStatus ,'Employee' as PersonType, 
  Photo as Picture,isnull(mctx_PersonBlackListing.BlackListing_comments,'') as comments,isnull(CONVERT(varchar(20), mctx_PersonBlackListing.modified_date,101),'') as commentsDate,isnull(mctx_PersonBlackListing.BlackListing_ID,'') as BlackListingID
  
   from Employee left join mctx_PersonBlackListing
  on Employee.EID=mctx_PersonBlackListing.Person_ID
   where REPLACE(STATUS, ' ', '')='BlackList' 
  end    
     
  else if  (@PersonType='EmployeeFamily')    
  begin    
 
 SELECT empfly.EFID as PID,'EFID' as PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'EmployeeFamily' as tableName, 
 IsNull(empfly.CardNumber,' ')as CardNumber,empfly.NIC,isnull(empfly.FirstName,'')+' '+isnull(empfly.LastName,'') as Name,
  emp.FirstName +' '+emp.LastName as OwnerName,emp.Nic as ownerNic,empfly.[Status] as UserStatus, 'Employee Family' as PersonType ,
  empfly.Photo as Picture,isnull(mctx_PersonBlackListing.BlackListing_comments,'') as comments,isnull(CONVERT(varchar(20), mctx_PersonBlackListing.modified_date,101),'') as commentsDate,isnull(mctx_PersonBlackListing.BlackListing_ID,'') as BlackListingID  
     from EmployeeFamily empfly left join Employee emp on empfly.EID=emp.EID 
     left join mctx_PersonBlackListing
  on empfly.EFID=mctx_PersonBlackListing.Person_ID
     where REPLACE(empfly.STATUS, ' ', '')='BlackList' 
  end  
    
  else if  (@PersonType='Servant')  
   begin  
      select sr.SID as PID, 'SID' as  PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'Servant' as tableName,
       IsNull(sr.CardNumber,' ') as CardNumber,sr.NIC,sr.FirstName+' '+sr.LastName as Name, emp.FirstName +' '+ emp.LastName as OwnerName,
       emp.Nic as ownerNic,sr.[Status] as UserStatus ,'Servant' as PersonType,sr.Photo as Picture,
       isnull(mctx_PersonBlackListing.BlackListing_comments,'') as comments,isnull(CONVERT(varchar(20), mctx_PersonBlackListing.modified_date,101),'') as commentsDate,isnull(mctx_PersonBlackListing.BlackListing_ID,'') as BlackListingID    
   from Servant sr left join Employee emp on sr.EID=emp.EID 
    left join mctx_PersonBlackListing
  on sr.SID=mctx_PersonBlackListing.Person_ID
   where REPLACE(sr.STATUS, ' ', '')='BlackList'
   end  
     
   else if  (@PersonType='ServantFamily')  
   begin  
select srfm.SFID as PID,'SFID' as  PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'ServantFamily' as tableName,
 IsNull(srfm.CardNumber,' ') as CardNumber,srfm.NIC,srfm.FirstName+' '+srfm.LastName as Name, emp.FirstName +' '+ emp.LastName as OwnerName
 ,emp.Nic as ownerNic,srfm.[Status] as UserStatus ,'Servant Family' as PersonType,srfm.Photo as Picture, 
 isnull(mctx_PersonBlackListing.BlackListing_comments,'') as comments,isnull(CONVERT(varchar(20), mctx_PersonBlackListing.modified_date,101),'') as commentsDate,isnull(mctx_PersonBlackListing.BlackListing_ID,'') as BlackListingID      
   from ServantFamily srfm left join Employee emp on srfm.EID=emp.EID
    left join mctx_PersonBlackListing
  on srfm.SFID=mctx_PersonBlackListing.Person_ID
    where REPLACE(srfm.STATUS, ' ', '')='BlackList' 
   end  
     
   else if  (@PersonType='NonResident')  
   begin  
   SELECT NRID as PID,'NRID'as  PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'NonResident' as tableName,IsNull(CardNumber,' ') as CardNumber 
   ,NIC,FirstName+' '+LastName as Name, 'Self' as OwnerName,NIC as ownerNic,[Status] as UserStatus ,'Non Resident' as PersonType, photo as Picture,
   isnull(mctx_PersonBlackListing.BlackListing_comments,'') as comments,isnull(CONVERT(varchar(20), mctx_PersonBlackListing.modified_date,101),'') as commentsDate,isnull(mctx_PersonBlackListing.BlackListing_ID,'') as BlackListingID      
     from NonResident
     left join mctx_PersonBlackListing
  on NonResident.NRID=mctx_PersonBlackListing.Person_ID
      where REPLACE(STATUS, ' ', '')='BlackList'   
   end  
     
   else if (@PersonType='Visitor')  
   begin  
  SELECT VID as PID,'VID' as  PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'Visitor' as tableName,isnull(CardNo,' ') as CardNumber,NIC,
  FirstName+' '+LastName as Name, 'Self' as OwnerName,NIC as ownerNic,[Status] as UserStatus ,'Visitor' as PersonType,''as Picture,
   isnull(mctx_PersonBlackListing.BlackListing_comments,'') as comments,isnull(CONVERT(varchar(20), mctx_PersonBlackListing.modified_date,101),'') as commentsDate,isnull(mctx_PersonBlackListing.BlackListing_ID,'') as BlackListingID      
     from Visitor 
     left join mctx_PersonBlackListing
  on Visitor.VID=mctx_PersonBlackListing.Person_ID
     
     where REPLACE(STATUS, ' ', '')='BlackList'  
   end  
     else if (@PersonType='mctx_visitor')  
   begin  
  SELECT ID as PID,'ID' as  PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'mctx_visitor' as tableName,'' as CardNumber,CNIC as NIC,
  VISITOR_NAME as Name, 'Self' as OwnerName,CNIC as ownerNic,[Status] as UserStatus ,'mctx_visitor' as PersonType,''as Picture,
   isnull(mctx_PersonBlackListing.BlackListing_comments,'') as comments,isnull(CONVERT(varchar(20), mctx_PersonBlackListing.modified_date,101),'') as commentsDate,isnull(mctx_PersonBlackListing.BlackListing_ID,'') as BlackListingID      
     from mctx_visitor 
     left join mctx_PersonBlackListing
  on mctx_visitor.ID=mctx_PersonBlackListing.Person_ID
     
     where REPLACE(STATUS, ' ', '')='BlackList'  
   end  
   else  
   begin  
   select 'No Record Found' as Name  
   end  
        
      
 END




GO
/****** Object:  StoredProcedure [dbo].[GetBusinessCommunity]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamid Ashfaq
-- Create date: 09-12-2020
-- Description:	Gender selection
-- =============================================
CREATE PROCEDURE [dbo].[GetBusinessCommunity] 
	-- Add the parameters for the stored procedure here
	--@ID int=null, 
	--@GenderName varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ID,BusinessName FROM [dbo].[mctx_BusinessCommunity]
END




GO
/****** Object:  StoredProcedure [dbo].[GetBusinessCommunityDetail]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamid Ashfaq
-- Create date: 09-12-2020
-- Description:	Gender selection
-- =============================================
CREATE PROCEDURE [dbo].[GetBusinessCommunityDetail] 
	-- Add the parameters for the stored procedure here
	--@ID int=null, 
	--@GenderName varchar(50) = null
	@CNIC nvarchar(50) = null,
	@Name nvarchar(50) = null,
	@CStatus nvarchar(50) = null 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id]
      ,[CNIC]
      ,[Name]
      ,[Gender]
      ,[DOB]
      ,[address]
      ,[FatherName]
      ,[IdentificationMark]
      ,[BloodGroup]
      ,[ValidityFrom]
      ,[ValidityTo]
      ,[BusinessCommunityCategory]
      ,[Designation]
      ,[NewPhoto]
      ,[CStatus]
      ,[ClearanceLevel]
      ,[ClearanceStatus]
      ,[Photo]
      ,[created_by]
      ,[created_date]
      ,[modified_by]
      ,[modified_date] ,
	  AuthenticationType
	  FROM [dbo].[mctx_BusinessCommunityDetail]

	  where 
	  ((@CNIC IS NULL) OR (CNIC=@CNIC))     
	   AND  ((@Name IS NULL) OR (Name=@Name)) 
	   AND ((@CStatus IS NULL) OR (CStatus=@CStatus)) 
END




GO
/****** Object:  StoredProcedure [dbo].[GetCadre]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetCadre]

AS
BEGIN
select * from mctx_Cadre
END




GO
/****** Object:  StoredProcedure [dbo].[GetCardCategory]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[GetCardCategory]  
  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    SELECT Card_Prefix ,Card_Name  FROM mctx_PersonCardCategory
 
END




GO
/****** Object:  StoredProcedure [dbo].[GetCaste]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Waqas Baig>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCaste]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT Caste_Id,Caste_Name FROM mctx_Caste
	where is_deleted=0
END




GO
/****** Object:  StoredProcedure [dbo].[GetCategory]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Waqas Baig>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
Create PROCEDURE [dbo].[GetCategory]  
  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    SELECT Person_CatID,Person_CatName  FROM mctx_PersonCategory  
 
END




GO
/****** Object:  StoredProcedure [dbo].[GetClearanceStatus]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClearanceStatus]
	
AS
BEGIN
	select * from dbo.ClearanceStatus
END




GO
/****** Object:  StoredProcedure [dbo].[GetClientID]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Waqas Baig>
-- Create date: <14 Jan 2016>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[GetClientID]	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select Client_ID,Client_IP from mctx_ClientMachinesInfo
END




GO
/****** Object:  StoredProcedure [dbo].[GetClients]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Waqas Baig>
-- Create date: <14 Jan 2016>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetClients]	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select Client_ID,Client_IP from mctx_ClientMachinesInfo where is_deleted=0
END




GO
/****** Object:  StoredProcedure [dbo].[GetConstractorCNIC_SP]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetConstractorCNIC_SP]  

@CNICAuto varchar(50)  

as  

begin  

    select CNIC  

    from mctx_ContractorInformation  

    where  CNIC like @CNICAuto +'%'  

end  




GO
/****** Object:  StoredProcedure [dbo].[GetContractor]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamid Ashfaq
-- Create date: 10-12-2020
-- Description:	Get Contractor
-- =============================================
CREATE PROCEDURE [dbo].[GetContractor] 
	-- Add the parameters for the stored procedure here
	@id int=NULL,                
	@CNIC varchar(250)=NULL,                
	@FirmName varchar(250)=NULL,                
	@CStatus nvarchar(20)=NULL   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id]
      ,[FirmName]
      ,[ContractorName]
      ,[Gender]
      ,[CNIC]
      ,[FirmAddress]
      ,[ResidantAddress]
      ,[MobileNo]
      ,[OfficeNumber]
      ,[IdentificationMark]
      ,[RankOrAppointment]
      ,[Photo]
      ,[created_by]
      ,[created_date]
      ,[modified_by]
      ,[modified_date]
      ,[CStatus]
      ,[NewPhoto]
      ,convert(varchar(10),ValidityFrom,101) as ValidityFrom--[ValidityFrom] as ValidFrom
      ,convert(varchar(10),ValidityTo,101) as ValidityTo--[ValidityTo] as ValidTo
      ,[ClearanceLevel] 
      ,[ClearanceStatus],
	  AuthenticationType
  FROM [dbo].[mctx_ContractorInformation]
  WHERE
  (@id is null OR id=@id)
  AND (@CNIC is null OR CNIC=@CNIC)
  AND (@FirmName is null OR FirmName like '%'+@FirmName+'%')
  AND(@CStatus is null or REPLACE(CStatus, ' ', '')=@CStatus)
END




GO
/****** Object:  StoredProcedure [dbo].[GetContractorLabor]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamid Ashfaq
-- Create date: 10-12-2020
-- Description:	Get Contractor
-- =============================================
CREATE PROCEDURE [dbo].[GetContractorLabor] 
	-- Add the parameters for the stored procedure here
	@id int=NULL,                
	@CNIC varchar(250)=NULL,                
	@LaborName varchar(250)=NULL,                
	@CStatus nvarchar(20)=NULL   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id]
      ,[ContractorName]
      ,[FirmName]
      ,[LaborName]
      ,[Gender]
      ,[CNIC]
      ,[IdentificationMark]
      ,[Placeofwork]
      ,[address]
      ,[MobileNumber]
      ,[Photo]
      ,[created_by]
      ,[created_date]
      ,[modified_by]
      ,[modified_date]
      ,[ClearanceStatus]
      ,[ClearanceLevel]
      , CONVERT(VARCHAR(10), ValidFrom,101)  [ValidFrom]
      ,CONVERT(VARCHAR(10), ValidTo,101)  [ValidTo]
      ,[CStatus]
      ,[NewPhoto],AuthenticationType
  FROM [dbo].[mctx_ContractorLaborInformation]
  WHERE
  (@id is null OR id=@id)
  AND (@CNIC is null OR CNIC=@CNIC)
  AND (@LaborName is null OR LaborName like '%'+@LaborName+'%')
  AND(@CStatus is null or REPLACE(CStatus, ' ', '')=@CStatus)
END




GO
/****** Object:  StoredProcedure [dbo].[GetContractorSlip]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetContractorSlip]



@cnic varchar(50) = ''







as







select id,ContractorName,CStatus,photo,ResidantAddress from mctx_ContractorInformation where CNIC = @cnic



GO
/****** Object:  StoredProcedure [dbo].[GetCount]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetCount]
as
begin
select count(*) from Employee where _status='1'
end 

select * from Employee
GO
/****** Object:  StoredProcedure [dbo].[GetDamoclesSensorTypeInfos]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GetDamoclesSensorTypeInfos]        
        
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;        
        
    SELECT Dam_Sen_Type_ID,Dam_Sen_Type from dbo.mctx_DamoclesSensorTypeInfo       
 where is_deleted=0 and Dam_Sen_Type is not null and Dam_Sen_Type !=''  order by Dam_Sen_Type      
        
        
         
        
END




GO
/****** Object:  StoredProcedure [dbo].[GetDamoclesSensorTypeInfos1]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDamoclesSensorTypeInfos1]        
        
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;        
        
    select abc.Dam_ID,def.Gate_Name,abc.Dam_IP + ' ' + def.Gate_Name as IPName from mctx_DamoclesInfo abc Left join mctx_Gates def on abc.Gate_ID = def.Gate_ID where abc.is_deleted = 0 and def.is_deleted = 0;   
        
        
         
        
END




GO
/****** Object:  StoredProcedure [dbo].[GetDepartment]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDepartment]    
    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
    SELECT Department_Id,Department_Name FROM mctx_Department    
 where is_deleted=0 and Department_Name is not null and Department_Name !=''  order by Department_Name  
    
    
     
    
END




GO
/****** Object:  StoredProcedure [dbo].[GetDepartmentForNonResidentSearch]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDepartmentForNonResidentSearch]      
      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
      
 select distinct mdpt.Department_ID,mdpt.Department_Name from mctx_Department mdpt inner join NonResident NR on mdpt.Department_ID=NR.Department     
 where mdpt.is_deleted=0  order by mdpt.Department_Name    
      
      
       
      
END




GO
/****** Object:  StoredProcedure [dbo].[GetDepartmentForResidentSearch]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDepartmentForResidentSearch]    
    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
 select distinct mdpt.Department_ID,mdpt.Department_Name from mctx_Department mdpt inner join Employee emp on mdpt.Department_ID=emp.Department   
 where mdpt.is_deleted=0  order by mdpt.Department_Name  
    
    
     
    
END




GO
/****** Object:  StoredProcedure [dbo].[GetDesignation]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Waqas Baig>    
-- Create date: <Create Date,,>    
-- Description: <Description,,>    
-- =============================================    
CREATE PROCEDURE [dbo].[GetDesignation]    
    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
    SELECT Designation_ID,designation as designation_Name FROM HR_Designation    
 where is_deleted=0 and designation is not null and designation!='' order by designation_Name   
END




GO
/****** Object:  StoredProcedure [dbo].[GetDesignationForNonResidentSearch]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  <Waqas Baig>      
-- Create date: <Create Date,,>      
-- Description: <Description,,>      
-- =============================================      
CREATE PROCEDURE [dbo].[GetDesignationForNonResidentSearch]      
      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
      
    SELECT distinct HD.Designation_ID,HD.designation as designation_Name FROM HR_Designation HD   inner join NonResident NR on HD.Designation_ID=NR.Designation  
 where HD.is_deleted=0      
END




GO
/****** Object:  StoredProcedure [dbo].[GetDesignationForResidentSearch]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Waqas Baig>    
-- Create date: <Create Date,,>    
-- Description: <Description,,>    
-- =============================================    
CREATE PROCEDURE [dbo].[GetDesignationForResidentSearch]    
    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
    SELECT distinct HD.Designation_ID,HD.designation as designation_Name FROM HR_Designation HD   inner join Employee emp on HD.Designation_ID=emp.Designation
 where HD.is_deleted=0    
END




GO
/****** Object:  StoredProcedure [dbo].[GetEducation]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Waqas Baig>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEducation]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT Education_ID,Education_Name from mctx_Education
	where is_deleted=0
END




GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeCNIC_SP]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext GetEmployeeCNIC_SP

--sp_helptext GetEmployeeCNIC_SP







CREATE procedure [dbo].[GetEmployeeCNIC_SP]  







@CNICAuto varchar(50)=''



As





begin  







    select Nic  







    from Employee  



	



    where  Nic like '%' + @CNICAuto +'%' 







end  




GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeDetail_SP]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetEmployeeDetail_SP]



@CNIC varchar (50) = NULL,

@empName varchar(50) = NULL,

@empdep int = 0,

@empdesg int = 0 

as

select emp.EID ,FirstName+ ' '+ emp.LastName as Names, emp.CurrAddr, dp.Department_Name, desi.designation from employee emp 

 join mctx_Department dp on emp.Department = dp.Department_ID

 join HR_Designation desi on emp.Designation =  desi.Designation_ID



 where ((emp.Nic = @CNIC or emp.ServiceNo = @CNIC)

 and

 ---- (emp.FirstName+' '+ emp.LastName  = @empName or emp.FirstName+' '+ emp.LastName  is null)

  -- and

  (emp.FirstName+' '+ emp.LastName like @empName +'%' or @empName is null)

   and (emp.Department = @empdep  or @empdep  = 0)

     and (emp.Designation = @empdesg or @empdesg = 0) 

  ---and 

  ----(emp.Designation = @empdesg  or emp.Designation is null)

   )






GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeFamily]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  <Waqas Baig>      
-- Create date: '<27 Jan 2016>      
-- Description: <Description,,>      
-- =============================================r      
-- select * from EmployeeFamily      
-- GetEmployeeFamily 3,null,1      
CREATE PROCEDURE [dbo].[GetEmployeeFamily]      
@EID int=Null,      
@EFID int=Null,      
@Status nvarchar(20)=NULL       
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
      
    SELECT top 100 empf.EID,empf.EFID,empf.FirstName,empf.LastName,empf.Relation,empf.NIC,empf.Mobile,empf.Photo,empf.vaddr,  
    empf.Status as [status],Rl.Relation_Name,emp.FirstName+' '+emp.LastName as ownerName    , address,  CONVERT(VARCHAR(10), Dob,101)  AS Dob , empf.SecurityClearance, FamilyGender,
	empf.ClearanceLevel,empf.ValidFrom,empf.ValidTo,empf.AuthenticationType
 FROM EmployeeFamily empf  
 left join mctx_Relation Rl on empf.Relation=Rl.Relation_ID   
 inner join Employee emp on emp.EID=empf.EID  
 WHERE       
 (@EID IS NULL OR empf.EID=@EID) AND      
 (@EFID IS NULL OR empf.EfID=@EFID)      
 -- and _status=@Status      
   AND (@Status is null or empf.Status=@Status)       
      
END




GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeName_SP]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext GetEmployeeName_SP

  --sp_helptext GetEmployeeName_SP



  --sp_helptext GetEmployeeCNIC_SP







CREATE procedure [dbo].[GetEmployeeName_SP]  







@NameAuto varchar(50)=''  



as  



begin  



    select FirstName+' '+ LastName as emp_Names  



    from Employee  



    where  FirstName+' '+ LastName like '%' + @NameAuto +'%'  



end  




GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================                        

-- AUTHOR:  <WAQAS BAIG>                        

-- CREATE DATE: <27 JAN 2016>                     

-- DESCRIPTION: <DESCRIPTION,,>                     

-- =============================================                      

-- SELECT * FROM EMPLOYEE                        

-- GETEMPLOYEES 3,'42000-7215685-1',NULL,NULL,NULL,1                     



	CREATE PROCEDURE [dbo].[GetEmployees]                       








@EID INT=NULL,                      





@NIC NVARCHAR(250)=NULL,                     















@DEPT NVARCHAR(250)=NULL,    















@RANK NVARCHAR(250)=NULL,                 















@DESG NVARCHAR(250)=NULL,                     















@NAME NVARCHAR(250)=NULL,                      















@STATUS NVARCHAR(20)=NULL                      















AS                  

BEGIN                       

-- SET NOCOUNT ON ADDED TO PREVENT EXTRA RESULT SETS FROM                    


-- INTERFERING WITH SELECT STATEMENTS.                    

 SET NOCOUNT ON;                        

 SELECT EID,SERVICENO,HR_DESIGNATION.DESIGNATION AS DESIGNATIONNAME,EMPLOYEE.DESIGNATION , Employee.Rank,  RNK.Rank_Name,   































 FIRSTNAME,LASTNAME,CURRADDR,PERADDR,NIC, CASE WHEN DOB = '1900-01-01 00:00:00.000' THEN ''       































    ELSE CONVERT(VARCHAR(10), DOB,101) END AS DOB,                        































 PHONEOFFICE,MOBILE,                    















 MCTX_DEPARTMENT.DEPARTMENT_NAME AS DEPARTMENT, EMPLOYEE.DEPARTMENT AS DEPARMENT_ID,EMPLOYEE.DESIGNATION AS DESIGNATION,        















 PHOTO,RNK.RANK_NAME,EMPLOYEE.NEWPHOTO,EMPLOYEE.modified_by,       Status,              















 (SELECT COUNT(EFID) FROM EMPLOYEEFAMILY WHERE EID=EMPLOYEE.EID ) AS FAMILYMEMBERS,                                        































 (SELECT COUNT(SID) FROM SERVANT WHERE EID=EMPLOYEE.EID  ) AS SERVANTS,































 (SELECT COUNT(GID) FROM ResidantGuest WHERE EID=EMPLOYEE.EID  ) AS Guests      































,MotherName , FatherName ,BloodGroup, IdentificationMark  , Employee.Cadre , ca.Cadre_Name,































EMPLOYEE.ResidantStatus , ra.Rasidant_Status_Name , cc.ColorName , Employee.CardColor,































tr.Transport_Name,  EMPLOYEE.Transport, 































per.Site_Name , EMPLOYEE.ClearanceLevel, CONVERT(VARCHAR(10), ValidUpto,101)  AS ValidUpto,ClearanceStatus,Section , employee.Gender GenID, Remarks,PhoneHome,AuthenticationType































 FROM EMPLOYEE                     































 LEFT JOIN MCTX_DEPARTMENT ON EMPLOYEE.DEPARTMENT=MCTX_DEPARTMENT.DEPARTMENT_ID                          































left join mctx_Cadre ca on ca.ID = Employee.Cadre































left join cardColor cc on cc.CardColor_ID = Employee.CardColor































left join mctx_Rasidant_Status ra on ra.ID = Employee.ResidantStatus































left join KRL_Transport tr on tr.Transport_ID = Employee.Transport































left join mctx_PersonSiteAllowed per on per.ID = Employee.ClearanceLevel































 LEFT JOIN MCTX_RANKS RNK ON EMPLOYEE.RANK=RNK.RANK_ID                    































 LEFT JOIN HR_DESIGNATION ON EMPLOYEE.DESIGNATION=HR_DESIGNATION.DESIGNATION_ID                    































-- left join gender gen on gen.ID = Employee.Gender































 WHERE (@EID IS NULL OR EID=@EID)















       































 AND ((@NIC IS NULL)OR (EMPLOYEE.NIC=@NIC)OR  (EMPLOYEE.ServiceNo=@NIC))                  































 AND ((@DEPT IS NULL) OR (EMPLOYEE.DEPARTMENT=@DEPT))                    































 AND ((@RANK IS NULL) OR (EMPLOYEE.RANK=@RANK))















 















 AND ((@DESG IS NULL) OR (EMPLOYEE.DESIGNATION=@DESG))                        































 AND ((@NAME IS NULL) OR (EMPLOYEE.FIRSTNAME +' '+ EMPLOYEE.LASTNAME LIKE '%'+@NAME+'%'))            































-- AND (@STATUS IS NULL OR REPLACE(STATUS, ' ', '')=@STATUS)















 















 AND (EMPLOYEE.STATUS = 'ACTIVE' AND EMPLOYEE._Status = 1)                  











 ORDER BY EMPLOYEE.FIRSTNAME ASC                 

END
GO
/****** Object:  StoredProcedure [dbo].[GetGate]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGate]      
      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
      
    SELECT Gate_ID,Gate_Name from mctx_Gates     
 where is_deleted=0 and Gate_Name is not null and Gate_Name !=''  order by Gate_Name    
      
      
       
      
END




GO
/****** Object:  StoredProcedure [dbo].[GetGateLane]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGateLane]
	
AS
BEGIN
	select * from dbo.Place
END




GO
/****** Object:  StoredProcedure [dbo].[GetGateNo]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGateNo]
	
AS
BEGIN
	select * from dbo.mctx_Gates
END




GO
/****** Object:  StoredProcedure [dbo].[GetGuest]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[GetGuest] 



	@EID int =null



AS

BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from



	-- interfering with SELECT statements.

	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT [GID]

     ,ResidantGuest.EID

	  ,Employee.FirstName

      ,ResidantGuest.CNIC

      ,ResidantGuest.Name

      ,mctx_Relation.Relation_Name

      ,ResidantGuest.Nationality

     ,ResidantGuest.FatherName

     ,ResidantGuest.Address

      ,ResidantGuest.MobileNumber



     ,ResidantGuest.IdentificationMark

      ,ResidantGuest.SecurityClearance

      ,convert(varchar,ResidantGuest.ValidityFrom,101) as ValidityFrom--ResidantGuest.[ValidityFrom]

      ,convert(varchar,ResidantGuest.ValidityTo,101) as ValidityTo--ResidantGuest.[ValidityTo]

	  ,convert(varchar,ResidantGuest.DOB,101) as Dob--ResidantGuest.[ValidityTo]

      ,ResidantGuest.Age

      ,ResidantGuest.Gender

      ,ResidantGuest.Occupation

      ,ResidantGuest.NewPhoto

      ,ResidantGuest.photo

      ,ResidantGuest.ClearLevel

      ,ResidantGuest.CStatus

     ,ResidantGuest.created_by

      ,ResidantGuest.created_date

     ,ResidantGuest.modified_by

     ,ResidantGuest.modified_date

  ,ResidantGuest.AuthenticationType

 FROM ResidantGuest 

 inner join Employee on ResidantGuest.EID=Employee.EID

 Left JOIN mctx_Relation ON mctx_Relation.Relation_ID=ResidantGuest.RelationType



  WHERE (@EID IS NULL OR ResidantGuest.EID=@EID) order by [GID] desc

 -- SELECT SID,Servant.EID, Employee.FirstName+' '+Employee.LastName  as EmployeeName,Servant.Status,Servant.FirstName,Servant.LastName,Servant.PerAddr,convert(varchar,Servant.DOB,101) as DOB,PlaceofWork,      



--Servant.NIC,MarkofIdentification,convert(varchar,Servant.DOB,101) as DOB

 --,convert(varchar,Servant.ValidityFrom,101) as ValidFrom,convert(varchar,Servant.ValidityTo,101) as ValidTo,Servant.Photo,Servant.MobileNumber as mobile,Employee.FirstName+' '+Employee.LastName as ownerName,      

 -- (SELECT count(*) FROM ServantFamily where SID=Servant.SID) as ServantFamilyMember      ,Servant.FatherName as FH , BCNumber,Servant.SecurityClearance,Servant.ClearanceLevel

END




GO
/****** Object:  StoredProcedure [dbo].[GetGuestCNIC_SP]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetGuestCNIC_SP]  

@CNICAuto varchar(50)  

as  

begin  

    select CNIC  

    from ResidantGuest  

    where  CNIC like @CNICAuto +'%'  

end  




GO
/****** Object:  StoredProcedure [dbo].[GetGuestName_SP]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetGuestName_SP]  



@NameAuto varchar(50)=''



As 



begin  



select Name as Name  



from  mctx_visitor

--ResidantGuest 

 where Name like '%' + @NameAuto +'%'  



end  

--select * from ResidantGuest



GO
/****** Object:  StoredProcedure [dbo].[GetGuestSlip]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetGuestSlip]

@cnic varchar(50) = null



as



select rg.GID,rg.Name,rg.CStatus,rg.photo,rg.Address,rg.DOB,rl.Relation_Name from ResidantGuest rg join mctx_Relation rl on rl.Relation_ID= rg.RelationType

join Employee emp on rg.EID  = emp.EID 

where CNIC = @cnic



GO
/****** Object:  StoredProcedure [dbo].[GetLaborSlip]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetLaborSlip]

@cnic varchar(50)= ''



as



select id,LaborName,CStatus,photo,address from mctx_ContractorLaborInformation where CNIC = @cnic



GO
/****** Object:  StoredProcedure [dbo].[GetLatestDesignation]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLatestDesignation]  

AS    

BEGIN    


 SET NOCOUNT ON;    


    SELECT Designation_ID,designation FROM HR_Designation    


END
GO
/****** Object:  StoredProcedure [dbo].[GetLocations]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Waqas Baig>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLocations]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT ID as Id, LocationName as LocName FROM Place
	where is_deleted=0
END




GO
/****** Object:  StoredProcedure [dbo].[GetMaxID]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author: <Waqas Baig> 
-- Create date: <25 Jan 2015>      
-- Description: <Description,,>      
-- =============================================      
-- GetMaxID 'Employee','ServiceNo',null           
create PROCEDURE [dbo].[GetMaxID]
 @TableName VARCHAR(50),    
 @ColumnName VARCHAR(50),    
 @MaxId int output
AS      
BEGIN      
 SET NOCOUNT ON;      
	
	SET @MaxId=(SELECT [Counter] FROM Counters WHERE ColumnName=@ColumnName AND TableName=@TableName)

	
	UPDATE Counters SET [Counter]=@MaxId+1 WHERE  ColumnName=@ColumnName AND TableName=@TableName
	
	
END




GO
/****** Object:  StoredProcedure [dbo].[GetNewMake]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




 CREATE PROCEDURE [dbo].[GetNewMake]    



AS    





BEGIN    

 SET NOCOUNT ON;    





    SELECT id, TransportMake FROM win_TransportMake    





END



GO
/****** Object:  StoredProcedure [dbo].[GetNonResidents]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================          
-- Author:  <Author,,Name>          
-- Create date: <Create Date,,>          
-- Description: <Description,,>          
-- =============================================          
-- select * from NonResident          
-- GetNonResidents 3,null,null,null,null,'Active'          
CREATE PROCEDURE [dbo].[GetNonResidents]           
@NRID int=NULL,          
@NIC nvarchar(250)=NULL,          
@Dept nvarchar(250)=NULL,          
@Desg nvarchar(250)=NULL,          
@Name nvarchar(250)=NULL,          
@Status nvarchar(20)=NULL          
          
AS          
BEGIN          
 -- SET NOCOUNT ON added to prevent extra result sets from          
 -- interfering with SELECT statements.          
 SET NOCOUNT ON;          
          
  SELECT top 100 NRID,CardNumber,FirstName,LastName,RelName,CurrAddr,PerAddr,NIC,PhoneHome,          
  PhoneOffice,Mobile,Religion,Sectt,Caste,Education,Witness1Name,Witness1Addr,Witness2Name,Witness2Addr,          
  Authority, CASE WHEN DateofEntry = '1900-01-01 00:00:00.000' THEN '' ELSE convert(varchar(10), DateofEntry,101) end as DateofEntry,
   CASE WHEN DateofRelease = '1900-01-01 00:00:00.000' THEN '' ELSE convert(varchar(10), DateofRelease,101) end as DateofRelease,Firm,FirmAddr,Product,ShopKeeper,        
  NonResident.Department,mctx_Department.Department_Name as DepartmentName  ,        
  Market,Status,photo,HR_Designation.designation as DesignationName, NonResident.Designation,Rel,NonResident.Rank_ID,Rnk.Rank_Name,NonResident.Person_CatID        
            
  FROM NonResident  left join HR_Designation on NonResident.Designation=HR_Designation.Designation_ID        
  left join mctx_Department on NonResident.Department=mctx_Department.Department_ID         
  left join mctx_Ranks Rnk on NonResident.Rank_ID=Rnk.Rank_ID        
    left join mctx_PersonCategory pcat on NonResident.Person_CatID=pcat.Person_CatID        
  WHERE           
  (@NRID is null or NRID=@NRID)
  AND ((@NIC is null) or (CardNumber=@NIC) or (Nic=@NIC ))          
  --AND (@NIC is null or Nic=@NIC)           
  AND (@Dept is null or Department=@Dept)          
  AND (@Desg is null or NonResident.Designation=@Desg)          
  --AND (@Name is null or (FirstName like '%'+@Name+'%' or LastName like '%'+@Name+'%'))     
  AND ((@NAME IS NULL) OR (FirstName +' '+ LastName LIKE '%'+@NAME+'%'))         
 -- AND Status=@Status       
   
    AND (@Status is null or REPLACE(Status, ' ', '')=@Status)           
  order by NonResident.NRID desc        
          
          
END




GO
/****** Object:  StoredProcedure [dbo].[GetPersonForIssueOrReturnCard]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
 -- Author:  <Author, Rahan Abbass>      
 -- Create date: <Create Date, 26-05-2016,>      
 -- Description: <Description,  Get Result from the different tables on the basis of CNIC No.,>      
 -- =============================================      
 --[dbo].[GetPersonForIssueOrReturnCard]'NonResident',null,'BKS-106/2017'      
 CREATE  PROCEDURE [dbo].[GetPersonForIssueOrReturnCard]    
  @PersonType nvarchar(255)=null,  
  @cnin nvarchar(50)=null,    
  @CardNo nvarchar(50)=null    
 AS      
 BEGIN      
  -- SET NOCOUNT ON added to prevent extra result sets from      
  -- interfering with SELECT statements.      
  SET NOCOUNT ON;      
 DECLARE @cnt int;      
  -- cnic, Name, card No, emplyeeType =table Name, owner name      
        
  if (@PersonType='Employee' )        
  begin       
      
SELECT EID as PID, 'EID' as PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'Employee' as tableName,IsNull(CardNumber,' ') as CardNumber    
  ,NIC,FirstName+' '+isnull(LastName,'') as Name, 'Self' as OwnerName ,Nic as ownerNic,[Status] as UserStatus ,'Employee' as PersonType,     
  Photo as Picture,ch.card_issueOrReturn_id,ch.Type_id,isnull(CONVERT(varchar(20),ch.[Date],101),'') as [Date]      
      
   from Employee  left join [mctx_CardIssueOrReturn] ch on Employee.EID=ch.[PID] 
  
   where  (@cnin IS NULL OR Nic=@cnin) and  (@CardNo IS NULL OR CardNumber=@CardNo)  
  end        
         
  else if  (@PersonType='EmployeeFamily')        
  begin        
     
 SELECT empfly.EFID as PID,'EFID' as PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'EmployeeFamily' as tableName,     
 IsNull(empfly.CardNumber,' ')as CardNumber,empfly.NIC,isnull(empfly.FirstName,'')+' '+isnull(empfly.LastName,'') as Name,    
  emp.FirstName +' '+emp.LastName as OwnerName,emp.Nic as ownerNic,empfly.[Status] as UserStatus, 'Employee Family' as PersonType ,    
  empfly.Photo as Picture,ch.card_issueOrReturn_id,ch.Type_id,isnull(CONVERT(varchar(20),ch.[Date],101),'') as [Date]   
     
     from EmployeeFamily empfly left join Employee emp on empfly.EID=emp.EID     
     left join [mctx_CardIssueOrReturn] ch on empfly.EFID=ch.[PID] 
     where  (@cnin IS NULL OR empfly.NIC=@cnin) and  (@CardNo IS NULL OR empfly.CardNumber=@CardNo)  
  end      
        
  else if  (@PersonType='Servant')      
   begin      
      select sr.SID as PID, 'SID' as  PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'Servant' as tableName,    
       IsNull(sr.CardNumber,' ') as CardNumber,sr.NIC,sr.FirstName+' '+sr.LastName as Name, emp.FirstName +' '+ emp.LastName as OwnerName,    
       emp.Nic as ownerNic,sr.[Status] as UserStatus ,'Servant' as PersonType,sr.Photo as Picture,ch.card_issueOrReturn_id,ch.Type_id,isnull(CONVERT(varchar(20),ch.[Date],101),'') as [Date]     
   from Servant sr left join Employee emp on sr.EID=emp.EID     
        left join [mctx_CardIssueOrReturn] ch on sr.SID=ch.[PID]
   where  (@cnin IS NULL OR sr.NIC=@cnin) and  (@CardNo IS NULL OR sr.CardNumber=@CardNo)    
   end      
         
   else if  (@PersonType='ServantFamily')      
   begin      
select srfm.SFID as PID,'SFID' as  PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'ServantFamily' as tableName,    
 IsNull(srfm.CardNumber,' ') as CardNumber,srfm.NIC,srfm.FirstName+' '+srfm.LastName as Name, emp.FirstName +' '+ emp.LastName as OwnerName    
 ,emp.Nic as ownerNic,srfm.[Status] as UserStatus ,'Servant Family' as PersonType,srfm.Photo as Picture,ch.card_issueOrReturn_id,ch.Type_id,isnull(CONVERT(varchar(20),ch.[Date],101),'') as [Date]      
   from ServantFamily srfm left join Employee emp on srfm.EID=emp.EID    
       left join [mctx_CardIssueOrReturn] ch on srfm.SFID=ch.[PID]
    where  (@cnin IS NULL OR srfm.NIC=@cnin) and  (@CardNo IS NULL OR srfm.CardNumber=@CardNo)      
   end      
         
   else if  (@PersonType='NonResident')      
   begin      
   SELECT NRID as PID,'NRID'as  PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'NonResident' as tableName,IsNull(CardNumber,' ') as CardNumber     
   ,NIC,FirstName+' '+LastName as Name, 'Self' as OwnerName,NIC as ownerNic,
   [Status] as UserStatus ,'Non Resident' as PersonType, photo as Picture,ch.card_issueOrReturn_id,ch.Type_id,isnull(CONVERT(varchar(20),ch.[Date],101),'') as [Date]         
     from NonResident    
        left join [mctx_CardIssueOrReturn] ch on NonResident.NRID=ch.[PID]
     where  (@cnin IS NULL OR NIC=@cnin) and  (@CardNo IS NULL OR CardNumber=@CardNo)  
   end      
         
   else if (@PersonType='Visitor')      
   begin      
  SELECT VID as PID,'VID' as  PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'Visitor' as tableName,isnull(CardNo,' ') as CardNumber,NIC,    
  FirstName+' '+LastName as Name, 'Self' as OwnerName,NIC as ownerNic,[Status] as UserStatus ,'Visitor' as PersonType,''as Picture,ch.card_issueOrReturn_id,ch.Type_id,isnull(CONVERT(varchar(20),ch.[Date],101),'') as [Date]      
     from Visitor     
      left join [mctx_CardIssueOrReturn] ch on Visitor.VID=ch.[PID]
         
      where  (@cnin IS NULL OR NIC=@cnin) and  (@CardNo IS NULL OR CardNo=@CardNo)  
   end      
      
   else      
   begin      
   select 'No Record Found' as Name      
   end      
            
          
 END




GO
/****** Object:  StoredProcedure [dbo].[GetPersonForIssueOrReturnCardHistory]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
 -- Author:  <Author, Rahan Abbass>      
 -- Create date: <Create Date, 26-05-2016,>      
 -- Description: <Description,  Get Result from the different tables on the basis of CNIC No.,>      
 -- =============================================      
 --[dbo].[GetPersonForIssueOrReturnCard]'NonResident',null,'SK-71/2017'      
 CREATE  PROCEDURE [dbo].[GetPersonForIssueOrReturnCardHistory]    
  @PersonType nvarchar(255)=null,  
  @cnin nvarchar(50)=null,    
  @CardNo nvarchar(50)=null    
 AS      
 BEGIN      
  -- SET NOCOUNT ON added to prevent extra result sets from      
  -- interfering with SELECT statements.      
  SET NOCOUNT ON;      
 DECLARE @cnt int;      
  -- cnic, Name, card No, emplyeeType =table Name, owner name      
        
  if (@PersonType='Employee' )        
  begin       
      
SELECT EID as PID, 'EID' as PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'Employee' as tableName,IsNull(CardNumber,' ') as CardNumber    
  ,NIC,FirstName+' '+isnull(LastName,'') as Name, 'Self' as OwnerName ,Nic as ownerNic,[Status] as UserStatus ,'Employee' as PersonType,     
  Photo as Picture,ch.card_issueOrReturn_his_id,ch.Type_Name,isnull(CONVERT(varchar(20),ch.[Date],101),'') as [Date]      
      
   from Employee  left join mctx_CardIssueOrReturn_History ch on Employee.EID=ch.[PID] 
  
   where  (@cnin IS NULL OR Nic=@cnin) and  (@CardNo IS NULL OR CardNumber=@CardNo) order by ch.card_issueOrReturn_his_id desc 
  end        
         
  else if  (@PersonType='EmployeeFamily')        
  begin        
     
 SELECT empfly.EFID as PID,'EFID' as PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'EmployeeFamily' as tableName,     
 IsNull(empfly.CardNumber,' ')as CardNumber,empfly.NIC,isnull(empfly.FirstName,'')+' '+isnull(empfly.LastName,'') as Name,    
  emp.FirstName +' '+emp.LastName as OwnerName,emp.Nic as ownerNic,empfly.[Status] as UserStatus, 'Employee Family' as PersonType ,    
  empfly.Photo as Picture,ch.card_issueOrReturn_his_id,ch.Type_Name,isnull(CONVERT(varchar(20),ch.[Date],101),'') as [Date]   
     
     from EmployeeFamily empfly left join Employee emp on empfly.EID=emp.EID     
     left join mctx_CardIssueOrReturn_History ch on empfly.EFID=ch.[PID] 
     where  (@cnin IS NULL OR empfly.NIC=@cnin) and  (@CardNo IS NULL OR empfly.CardNumber=@CardNo) order by ch.card_issueOrReturn_his_id desc   
  end      
        
  else if  (@PersonType='Servant')      
   begin      
      select sr.SID as PID, 'SID' as  PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'Servant' as tableName,    
       IsNull(sr.CardNumber,' ') as CardNumber,sr.NIC,sr.FirstName+' '+sr.LastName as Name, emp.FirstName +' '+ emp.LastName as OwnerName,    
       emp.Nic as ownerNic,sr.[Status] as UserStatus ,'Servant' as PersonType,sr.Photo as Picture,ch.card_issueOrReturn_his_id,ch.Type_Name,isnull(CONVERT(varchar(20),ch.[Date],101),'') as [Date]     
   from Servant sr left join Employee emp on sr.EID=emp.EID     
        left join mctx_CardIssueOrReturn_History ch on sr.SID=ch.[PID]
   where  (@cnin IS NULL OR sr.NIC=@cnin) and  (@CardNo IS NULL OR sr.CardNumber=@CardNo)  order by ch.card_issueOrReturn_his_id desc   
   end      
         
   else if  (@PersonType='ServantFamily')      
   begin      
select srfm.SFID as PID,'SFID' as  PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'ServantFamily' as tableName,    
 IsNull(srfm.CardNumber,' ') as CardNumber,srfm.NIC,srfm.FirstName+' '+srfm.LastName as Name, emp.FirstName +' '+ emp.LastName as OwnerName    
 ,emp.Nic as ownerNic,srfm.[Status] as UserStatus ,'Servant Family' as PersonType,srfm.Photo as Picture,ch.card_issueOrReturn_his_id,ch.Type_Name,isnull(CONVERT(varchar(20),ch.[Date],101),'') as [Date]      
   from ServantFamily srfm left join Employee emp on srfm.EID=emp.EID    
       left join mctx_CardIssueOrReturn_History ch on srfm.SFID=ch.[PID]
    where  (@cnin IS NULL OR srfm.NIC=@cnin) and  (@CardNo IS NULL OR srfm.CardNumber=@CardNo) order by ch.card_issueOrReturn_his_id desc      
   end      
         
   else if  (@PersonType='NonResident')      
   begin      
   SELECT NRID as PID,'NRID'as  PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'NonResident' as tableName,IsNull(CardNumber,' ') as CardNumber     
   ,NIC,FirstName+' '+LastName as Name, 'Self' as OwnerName,NIC as ownerNic,
   [Status] as UserStatus ,'Non Resident' as PersonType, photo as Picture,ch.card_issueOrReturn_his_id,ch.Type_Name,isnull(CONVERT(varchar(20),ch.[Date],101),'') as [Date]         
     from NonResident    
        left join mctx_CardIssueOrReturn_History ch on NonResident.NRID=ch.[PID]
     where  (@cnin IS NULL OR NIC=@cnin) and  (@CardNo IS NULL OR CardNumber=@CardNo)  order by ch.card_issueOrReturn_his_id desc
   end      
         
   else if (@PersonType='Visitor')      
   begin      
  SELECT VID as PID,'VID' as  PrimaryKeyColumnName,'NewPhoto' as ImagecolumnName,'Visitor' as tableName,isnull(CardNo,' ') as CardNumber,NIC,    
  FirstName+' '+LastName as Name, 'Self' as OwnerName,NIC as ownerNic,[Status] as UserStatus ,'Visitor' as PersonType,''as Picture,ch.card_issueOrReturn_his_id,ch.Type_Name,isnull(CONVERT(varchar(20),ch.[Date],101),'') as [Date]      
     from Visitor     
      left join mctx_CardIssueOrReturn_History ch on Visitor.VID=ch.[PID]
         
      where  (@cnin IS NULL OR NIC=@cnin) and  (@CardNo IS NULL OR CardNo=@CardNo) order by ch.card_issueOrReturn_his_id desc  
   end      
      
   else      
   begin      
   select 'No Record Found' as Name      
   end      
            
          
 END




GO
/****** Object:  StoredProcedure [dbo].[GetPersonInfoFromDifferentTablesUsingCardNumber]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
 -- Author:  <Author, Rahan Abbass>  
 -- Create date: <Create Date, 26-05-2016,>  
 -- Description: <Description,  Get Result from the different tables on the basis of CNIC No.,>  
 -- =============================================
 --  GetPersonInfoFromDifferentTablesUsingCardNumber 'Employee','61101-7165465-9'
 CREATE PROCEDURE [dbo].[GetPersonInfoFromDifferentTablesUsingCardNumber]
 
 @UserType varchar(20)= null , 
   
  @CardNo nvarchar(255)=null  
 AS  
 BEGIN  
  -- SET NOCOUNT ON added to prevent extra result sets from  
  -- interfering with SELECT statements.  
  SET NOCOUNT ON;  
 DECLARE @cnt int;  
  -- cnic, Name, card No, emplyeeType =table Name, owner name  
    
  if(@UserType = 'Employee' )    
  begin   
  select EID ID, Nic CNIC, FirstName + ' ' + LastName as name , FatherName  , 'Employee' as PersonType from employee where  Nic = @CardNo
  end    
     
  else if (@UserType = 'Employee Family')   
  begin    
 
 select EFID ID ,  NIC CNIC ,FirstName + ' ' + LastName as name , '' FatherName , 'EmployeeFamily' as PersonType  from EmployeeFamily where NIC =  @CardNo
  end  
    
  else if (@UserType = 'Employee Servent')  
   begin  
    select SID ID  , NIC CNIC , FirstName + ' ' + LastName as name , FatherName  , 'EmployeeServent' as PersonType From Servant where NIC = @CardNo
   end  
     
   else if(@UserType =  'Employee Guest' )
   begin  
select GID  ID , CNIC,name , FatherName ,  'EmployeeGuest' as PersonType From  ResidantGuest  where CNIC = @CardNo
   end  
     
   else if (@UserType =  'Buisseness Community')
   begin  
   select id ID , CNIC , Name , FatherName , 'BuissenessCommunity' as PersonType  from mctx_BusinessCommunityDetail where CNIC = @CardNo
   end  
     
   else if (@UserType ='Contractor')
   begin  
  select id  ID , CNIC , ContractorName  , '' fatherName , 'Contractor' as PersonType From mctx_ContractorInformation  where CNIC = @CardNo
   end 
   else if (@UserType ='Contractor Labor')
   begin  
  select id ID , CNIC, LaborName name  , '' FatherName , 'ContractorLabor' as PersonType from mctx_ContractorLaborInformation where CNIC = @CardNo
   end  
     
   else  
   begin  
   select 'No Record Found' as Name  
   end  
        
      
 END




GO
/****** Object:  StoredProcedure [dbo].[GetRanks]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Waqas Baig>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[GetRanks]  
  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    SELECT Rank_ID,Rank_Name  FROM mctx_Ranks  
 where is_deleted=0  
END




GO
/****** Object:  StoredProcedure [dbo].[GetRasidantStatus]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRasidantStatus]

AS
BEGIN
select * from mctx_Rasidant_Status
END




GO
/****** Object:  StoredProcedure [dbo].[GetRelation]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================



-- Author:		<Waqas Baig>



-- Create date: <Create Date,,>



-- Description:	<Description,,>



-- =============================================



CREATE PROCEDURE [dbo].[GetRelation]







AS



BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from



	-- interfering with SELECT statements.



	SET NOCOUNT ON;







    SELECT Relation_Id,Relation_Name FROM mctx_Relation



	where is_deleted=0



END




GO
/****** Object:  StoredProcedure [dbo].[GetRelationshipSP]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetRelationshipSP]







as
BEGIN

SET NOCOUNT ON



Select Relation_ID, Relation_Name From mctx_Relation
where is_deleted=0

END



GO
/****** Object:  StoredProcedure [dbo].[GetReligion]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Waqas Baig>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetReligion]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT Religion_Id,Religion_Name FROM mctx_Religion
	where is_deleted=0
END




GO
/****** Object:  StoredProcedure [dbo].[GetremarkedUVSSlog]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetremarkedUVSSlog]



as

select  CONVERT(INT,uv.UVSSID) , uv.LogDate, uv.LogDateTime, uv.CameraIP,

uv.Sequence, uv.VehicleNumber,  CONVERT(INT,uv.FOD) as FOD  , uv.PDI, CONVERT(INT,uv.Previous) as Previous ,

uv.PreviousPath, pl.LocationName, uv.RevisedDecision, uv.RevisedRemarks



 from tbl_UVSSlog uv left join Place pl on pl.ID = uv.Place_Id  where (PDI='0' and RevisedDecision is not null and RevisedRemarks is not null)




GO
/****** Object:  StoredProcedure [dbo].[GetSectt]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Waqas Baig>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[GetSectt]  
  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    SELECT Sectt_ID,Sectt_Name FROM mctx_Sectt  
 where is_deleted=0  
END




GO
/****** Object:  StoredProcedure [dbo].[GetServant]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext GetServant



CREATE PROCEDURE [dbo].[GetServant]   



@EID int=Null        



AS        



BEGIN        







 -- SET NOCOUNT ON added to prevent extra result sets from        



 -- interfering with SELECT statements.        



 SET NOCOUNT ON;        



  



   SELECT SID,Servant.EID, Employee.FirstName+' '+Employee.LastName  as EmployeeName,Servant.Status,Servant.FirstName,Servant.LastName,Servant.PerAddr,convert(varchar,Servant.DOB,101) as DOB,PlaceofWork,      



 Servant.NIC,MarkofIdentification,convert(varchar,Servant.DOB,101) as DOB



 ,convert(varchar,Servant.ValidityFrom,101) as ValidFrom,convert(varchar,Servant.ValidityTo,101) as ValidTo,Servant.Photo,Servant.MobileNumber as mobile,Employee.FirstName+' '+Employee.LastName as ownerName,      



  --(SELECT count(*) FROM ServantFamily where SID=Servant.SID) as ServantFamilyMember 







    Servant.FatherName as FH , BCNumber,Servant.SecurityClearance,Servant.ClearanceLevel,



  Servant.AuthenticationType







FROM Servant  inner join Employee on Servant.EID=Employee.EID  







 --left join mctx_Religion on Servant.Religion=mctx_Religion.Religion_ID      







WHERE         



 (@EID IS NULL OR Servant.EID =@EID)          



 -- and Servant.status='Active'        







END




GO
/****** Object:  StoredProcedure [dbo].[GetServantFamily]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Waqas Baig>    
-- Create date: '<27 Jan 2016>    
-- Description: <Description,,>    
-- =============================================r    
-- select * from ServantFamily    
-- GetServantFamily 6    
CREATE PROCEDURE [dbo].[GetServantFamily]    
@SID int    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
   SELECT sf.SFID,sf.SID,sf.EID,sf.CardNumber,sf.FirstName,sf.LastName,sf.Profession,sf.Relation,mr.Relation_Name,sf.NIC,sf.Status,sf.PlaceofWork,sf.Photo,sf.Mobile,s.FirstName+' '+s.LastName as ownerName    
    
 FROM ServantFamily sf left join mctx_Relation mr on sf.Relation=mr.Relation_ID  
 inner join Servant s on s.SID=sf.SID
 WHERE sf.SID=@SID     
 -- and [status]='Active'     
END




GO
/****** Object:  StoredProcedure [dbo].[GetSiteAllowed]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSiteAllowed]

AS
BEGIN
select * from mctx_PersonSiteAllowed
END




GO
/****** Object:  StoredProcedure [dbo].[GetSiteAllowedForWiegandDevices]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSiteAllowedForWiegandDevices] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select * from mctx_PersonSiteAllowed where ID = 3
    -- Insert statements for procedure here
	
END




GO
/****** Object:  StoredProcedure [dbo].[GetTerminalInfo]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTerminalInfo]
	
AS
BEGIN
	select * from mctx_TerminalInfos
END




GO
/****** Object:  StoredProcedure [dbo].[GetTerminalNameAndIPs]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

  
  
CREATE PROCEDURE [dbo].[GetTerminalNameAndIPs]        
        
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;        
        
   SELECT  [Terminal_ID],[Terminal_IP]+' '+[TerminalName] as TerminalInfo
    
  FROM [dbo].[mctx_TerminalInfos] where controller like'%040%'     
        
        
         
        
END




GO
/****** Object:  StoredProcedure [dbo].[GetTerminalType]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Waqas Baig>
-- Create date: <14 Jan 2016>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[GetTerminalType]	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select Terminal_Type_ID, Terminal_type from mctx_TerminalType
END




GO
/****** Object:  StoredProcedure [dbo].[GetTransport]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTransport]

AS
BEGIN
select * from KRL_Transport
END




GO
/****** Object:  StoredProcedure [dbo].[GetUserById]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  

-- Author:  <Waqas Baig>  

-- Create date: <14 Jan 2016>  

-- Description: <Description,,>  

-- =============================================  

-- GetUserById 1  

CREATE PROCEDURE [dbo].[GetUserById]   

@UserId bigint  

AS  

BEGIN  

 -- SET NOCOUNT ON added to prevent extra result sets from  

 -- interfering with SELECT statements.  

 SET NOCOUNT ON;  

  

    SELECT userid,username,password,firstname,lastname,address,city,phone,mobile,email,RoleId,UserType   

 FROM users   

 WHERE userid=@UserId  and IsActive=1

END







GO
/****** Object:  StoredProcedure [dbo].[GetUserForMonitoring]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserForMonitoring]
 
 @UserType varchar(20)= null , 
   
  @ID nvarchar(255)=null  
 AS  
 BEGIN  
  -- SET NOCOUNT ON added to prevent extra result sets from  
  -- interfering with SELECT statements.  
  SET NOCOUNT ON;  
 DECLARE @cnt int;  
  -- cnic, Name, card No, emplyeeType =table Name, owner name  
    
  if(@UserType = 'Employee' )    
  begin   
  select EID ID, FirstName +' ' + LastName as Name, validUpto ExpriyDate , ClearanceLevel ClearanceLevel, ClearanceStatus ClearanceStatus,'Employee' as PersonType, AuthenticationType from employee where  EID = @ID
  end    
     
  else if (@UserType = 'Employee Family')   
  begin    
 
 select EFID ID , FirstName +' ' + LastName as Name, ValidFrom as  ExpriyDate , ClearanceLevel ClearanceLevel, SecurityClearance ClearanceStatus, 'EmployeeFamily' as PersonType  ,AuthenticationType from EmployeeFamily where EFID =  @ID
  end  
    
  else if (@UserType = 'Employee Servent')  
   begin  
    select SID ID  ,  FirstName +' ' + LastName as Name,validityTo ExpriyDate, ClearanceLevel ClearanceLevel, SecurityClearance ClearanceStatus , 'EmployeeServent' as PersonType   ,AuthenticationType From Servant where SID = @ID
   end  
     
   else if(@UserType =  'Employee Guest' )
   begin  
select GID  ID ,Name as Name, ValidityTo ExpriyDate, ClearLevel ClearanceLevel, SecurityClearance ClearanceStatus,  'EmployeeGuest' as PersonType  ,AuthenticationType  From  ResidantGuest  where GID = @ID
   end  
     
   else if (@UserType =  'Buisseness Community')
   begin  
   select id ID ,  Name as Name ,ValidityTo ExpriyDate , ClearanceLevel ClearanceLevel, ClearanceStatus ClearanceStatus , 'BuissenessCommunity' as PersonType  ,AuthenticationType  from mctx_BusinessCommunityDetail where id = @ID
   end  
     
   else if (@UserType ='Contractor')
   begin  
  select id  ID ,ContractorName  as  Name, validityTo ExpriyDate, ClearanceLevel ClearanceLevel, ClearanceStatus ClearanceStatus, 'Contractor' as PersonType   ,AuthenticationType  From mctx_ContractorInformation  where id = @ID
   end 
   else if (@UserType ='Contractor Labor')
   begin  
  select id ID , LaborName as Name,validTo ExpriyDate, ClearanceLevel ClearanceLevel , ClearanceStatus ClearanceStatus, 'ContractorLabor' as PersonType ,AuthenticationType  from mctx_ContractorLaborInformation where id = @ID
   end  
     
   else  
   begin  
   select 'No Record Found' as Name  
   end  
        
      
 END




GO
/****** Object:  StoredProcedure [dbo].[GetUserForMonitoringNew]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserForMonitoringNew]
 
 @UserType varchar(20)= null , 
   
  @ID nvarchar(20)=null  
 AS  
 BEGIN  
  -- SET NOCOUNT ON added to prevent extra result sets from  
  -- interfering with SELECT statements.  
  SET NOCOUNT ON;  
 DECLARE @cnt int;  
  -- cnic, Name, card No, emplyeeType =table Name, owner name  
    
  if(@UserType = 'Employee' )    
  begin   
  select EID ID, FirstName +' ' + LastName as Name, created_date ValidFrom, validUpto ExpiryDate , ClearanceLevel ClearanceLevel, ClearanceStatus ClearanceStatus,'Employee' as PersonType, AuthenticationType from employee where  NIC = @ID
  end    
     
  else if (@UserType = 'Employee Family')   
  begin    
 
 select EFID ID , FirstName +' ' + LastName as Name,ValidFrom, ValidTo as  ExpiryDate , ClearanceLevel ClearanceLevel, SecurityClearance ClearanceStatus, 'EmployeeFamily' as PersonType  ,AuthenticationType from EmployeeFamily where NIC =  @ID
  end  
    
  else if (@UserType = 'Employee Servent')  
   begin  
    select SID ID  ,  FirstName +' ' + LastName as Name,ValidityFrom as ValidFrom, validityTo ExpiryDate, ClearanceLevel ClearanceLevel, SecurityClearance ClearanceStatus , 'EmployeeServent' as PersonType   ,AuthenticationType From Servant where NIC = @ID
   end  
     
   else if(@UserType =  'Employee Guest' )
   begin  
select Top 1 GID  ID ,Name as Name, ValidityFrom as ValidFrom, ValidityTo ExpiryDate, ClearLevel ClearanceLevel, SecurityClearance ClearanceStatus,  'EmployeeGuest' as PersonType  ,AuthenticationType  From  ResidantGuest  where CNIC = @ID order by GID desc
   end  
     
   else if (@UserType =  'Buisseness Community')
   begin  
   select id ID ,  Name as Name , ValidityFrom as ValidFrom, ValidityTo ExpiryDate , ClearanceLevel ClearanceLevel, ClearanceStatus ClearanceStatus , 'BuissenessCommunity' as PersonType  ,AuthenticationType  from mctx_BusinessCommunityDetail where CNIC = @ID
   end  
     
   else if (@UserType ='Contractor')
   begin  
  select id  ID ,ContractorName  as  Name, ValidityFrom as ValidFrom, validityTo ExpiryDate, ClearanceLevel ClearanceLevel, ClearanceStatus ClearanceStatus, 'Contractor' as PersonType   ,AuthenticationType  From mctx_ContractorInformation  where CNIC = @ID
   end 
   else if (@UserType ='Contractor Labor')
   begin  
  select id ID , LaborName as Name, ValidFrom as ValidFrom, validTo ExpiryDate, ClearanceLevel ClearanceLevel , ClearanceStatus ClearanceStatus, 'ContractorLabor' as PersonType ,AuthenticationType  from mctx_ContractorLaborInformation where CNIC = @ID
   end  
     
   else  
   begin  
   select 'No Record Found' as Name  
   end  
        
      
 END




GO
/****** Object:  StoredProcedure [dbo].[GetUserForMonitoringNewNameSep]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[GetUserForMonitoringNewNameSep]
 
 @UserType varchar(20)= null , 
   
  @ID nvarchar(20)=null  
 AS  
 BEGIN  
  -- SET NOCOUNT ON added to prevent extra result sets from  
  -- interfering with SELECT statements.  
  SET NOCOUNT ON;  
 DECLARE @cnt int;  
  -- cnic, Name, card No, emplyeeType =table Name, owner name  
    
  if(@UserType = 'Employee' )    
  begin   
  select EID ID, FirstName as name,  created_date ValidFrom, validUpto ExpiryDate , ClearanceLevel ClearanceLevel, ClearanceStatus ClearanceStatus,'Employee' as PersonType, AuthenticationType,LastName as name1 from employee where  NIC = @ID
  end    
     
  else if (@UserType = 'Employee Family')   
  begin    
 
 select EFID ID , FirstName as name ,ValidFrom, ValidTo as  ExpiryDate , ClearanceLevel ClearanceLevel, SecurityClearance ClearanceStatus, 'EmployeeFamily' as PersonType  ,AuthenticationType,LastName as name1 from EmployeeFamily where NIC =  @ID
  end  
    
  else if (@UserType = 'Employee Servent')  
   begin  
    select SID ID  ,  FirstName as name ,ValidityFrom as ValidFrom, validityTo ExpiryDate, ClearanceLevel ClearanceLevel, SecurityClearance ClearanceStatus , 'EmployeeServent' as PersonType   ,AuthenticationType,LastName as name1 From Servant where NIC = @ID
   end  
     
   else if(@UserType =  'Employee Guest' )
   begin  
select Top 1 GID  ID ,Name as Name, ValidityFrom as ValidFrom, ValidityTo ExpiryDate, ClearLevel ClearanceLevel, SecurityClearance ClearanceStatus,  'EmployeeGuest' as PersonType  ,AuthenticationType  From  ResidantGuest  where CNIC = @ID order by GID desc
   end  
     
   else if (@UserType =  'Buisseness Community')
   begin  
   select id ID ,  Name as Name , ValidityFrom as ValidFrom, ValidityTo ExpiryDate , ClearanceLevel ClearanceLevel, ClearanceStatus ClearanceStatus , 'BuissenessCommunity' as PersonType  ,AuthenticationType  from mctx_BusinessCommunityDetail where CNIC = @ID
   end  
     
   else if (@UserType ='Contractor')
   begin  
  select id  ID ,ContractorName  as  Name, ValidityFrom as ValidFrom, validityTo ExpiryDate, ClearanceLevel ClearanceLevel, ClearanceStatus ClearanceStatus, 'Contractor' as PersonType   ,AuthenticationType  From mctx_ContractorInformation  where CNIC = @ID
   end 
   else if (@UserType ='Contractor Labor')
   begin  
  select id ID , LaborName as Name, ValidFrom as ValidFrom, validTo ExpiryDate, ClearanceLevel ClearanceLevel , ClearanceStatus ClearanceStatus, 'ContractorLabor' as PersonType ,AuthenticationType  from mctx_ContractorLaborInformation where CNIC = @ID
   end  
     
   else  
   begin  
   select 'No Record Found' as Name  
   end  
        
      
 END



GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================



-- Author:		<Waqas Baig>



-- Create date: <14 Jan 2016>



-- Description:	<Description,,>



-- =============================================



CREATE PROCEDURE [dbo].[GetUsers]	



@Status bit



AS



BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from



	-- interfering with SELECT statements.



	SET NOCOUNT ON;







    SELECT userid,username,password,firstname,lastname,address,city,phone,mobile,email,R.RoleName,UserType 



	FROM users



	JOIN Roles R on R.RoleId=users.RoleId



	WHERE Users.IsActive=@Status


END
GO
/****** Object:  StoredProcedure [dbo].[GetUVSSFOD]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUVSSFOD]    

    

AS    

BEGIN    

 -- SET NOCOUNT ON added to prevent extra result sets from    

 -- interfering with SELECT statements.    

 SET NOCOUNT ON;    

    

    SELECT FOD_ID,FOD_Status FROM UVSS_FOD    

 where FOD_Status is not null and FOD_Status !='' 

    

    

     

    

END






GO
/****** Object:  StoredProcedure [dbo].[GetUVSSFOD1]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUVSSFOD1]    

    

AS    

BEGIN    

 -- SET NOCOUNT ON added to prevent extra result sets from    

 -- interfering with SELECT statements.    

 SET NOCOUNT ON;    

    

    SELECT FOD_ID,FOD_Status FROM UVSS_FOD    

 where FOD_Status is not null and FOD_Status !='' 

    

    

     

    

END






GO
/****** Object:  StoredProcedure [dbo].[GetUVSSlog]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[GetUVSSlog] 

as

select  CONVERT(INT,uv.UVSSID) , uv.LogDate, uv.LogDateTime, uv.CameraIP,

uv.Sequence, uv.VehicleNumber,  CONVERT(INT,uv.FOD)  , uv.PDI, CONVERT(INT,uv.Previous) ,

uv.PreviousPath, uv.IsHandled, uv.IsDisplayed, pl.LocationName



 from tbl_UVSSlog uv  left join Place pl on pl.ID = uv.Place_Id  where PDI='0' and RevisedDecision is null and RevisedRemarks is null



GO
/****** Object:  StoredProcedure [dbo].[GetVehicleNo]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetVehicleNo]    
    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
    SELECT VACS_ID,VehicleNo FROM mctx_VACS    
 where VehicleNo is not null and VehicleNo !='' 
    
    
     
    
END



GO
/****** Object:  StoredProcedure [dbo].[GetVehicleType]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetVehicleType]    
    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
    SELECT VACS_ID,VehicleType FROM mctx_VACS    
 where VehicleType is not null and VehicleType !='' 
    
    
     
    
END



GO
/****** Object:  StoredProcedure [dbo].[GuestAdd]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  Hamid Ashfaq  
-- Create date: 17-12-2020  
-- Description: Resident Guest Add  
-- =============================================  
CREATE PROCEDURE [dbo].[GuestAdd]  
		@GID int output,
		@EID int,
        @CNIC varchar(50)=null,
        @Name varchar(50)=null,
        @RelationType varchar(50)=null,
        @Nationality varchar(50)=null,
        @FatherName varchar(50)=null,
        @Address varchar(50)=null,
        @MobileNumber varchar(50)=null,
        @IdentificationMark varchar(50)=null,
        @SecurityClearance varchar(50)=null,
        @ValidityFrom date=null,
        @ValidityTo date=null,
        @DOB date=null,
        @Age varchar(50)=null,
        @Gender varchar(50)=null,
        @Occupation varchar(50)=null,
        @NewPhoto image=null,
        @photo nvarchar(50)=null,
        @ClearLevel nvarchar(50)=null,
		@created_by varchar(50)=null,
        @created_date datetime=null,
		@AuthType nvarchar(50)=null

--@SID int output,  
--@EID int,  
--@BCnumber nvarchar(10)=null,
--@FirstName nvarchar(255)=null,  
--@LastName nvarchar(255)=null,  
--@FH nvarchar(255)=null,  

--@PerAddr nvarchar(255)=null,  

--@DOB datetime,  

--@NIC nvarchar(255)=null,  

--@MarkofIdentification nvarchar(255)=null,  
--@Photo  nvarchar(255)=null,  

--@mobile nvarchar(255)=null,  
--@created_by bigint,  
--@created_date datetime,

--@validTo date,
--@validFrom date,
--@SeurityClearance varchar(10)=null,
--@clearanaceLevel varchar(10) = null,

--@NewPhoto image = null   
  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  

  
    
 --EXEC dbo.GetMaxID 'ResidantGuest','EID',@EID output  
   
 INSERT INTO [dbo].[ResidantGuest]
           ([EID]
           ,[CNIC]
           ,[Name]
           ,[RelationType]
           ,[Nationality]
           ,[FatherName]
           ,[Address]
           ,[MobileNumber]
           ,[IdentificationMark]
           ,[SecurityClearance]
           ,[ValidityFrom]
           ,[ValidityTo]
           ,[DOB]
           ,[Age]
           ,[Gender]
           ,[Occupation]
           ,[NewPhoto]
           ,[photo]
           ,[ClearLevel]
		   ,[CStatus]
		   ,[created_by]
           ,[created_date],AuthenticationType)
     VALUES
           (@EID
           ,@CNIC
           ,@Name
           ,@RelationType
           ,@Nationality
           ,@FatherName
           ,@Address
           ,@MobileNumber
           ,@IdentificationMark
           ,@SecurityClearance
           ,@ValidityFrom
           ,@ValidityTo
           ,@DOB
           ,@Age
           ,@Gender
           ,@Occupation
           ,@NewPhoto
           ,@photo
           ,@ClearLevel
		   ,'Active'
		   ,@created_by
           ,@created_date,@AuthType) 
 --INSERT INTO Servant(SID,EID,FirstName,LastName,FatherName,PerAddr,DOB,NIC,  
 --MarkofIdentification,Photo,Status,
 --_status,MobileNumber,created_by,created_date,NewPhoto,ValidityFrom,ValidityTo , SecurityClearance, ClearanceLevel,BCnumber)  
  
  
 --VALUES (@SID,@EID,@FirstName,@LastName,@FH,@PerAddr,@DOB,@NIC,@MarkofIdentification,@Photo,'Active',  
 --1,@mobile,@created_by,@created_date,@NewPhoto, @validFrom , @validTo , @SeurityClearance,@clearanaceLevel,@BCnumber)  
  
      
END




GO
/****** Object:  StoredProcedure [dbo].[GuestUpdate]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
      
-- Author:  Hamid Ashfaq      
      
-- Create date: 17-12-2020      
      
-- Description: Update Guest      
      
-- =============================================      
      
CREATE PROCEDURE [dbo].[GuestUpdate]      
	    @GID int,
	    @EID int,
        @CNIC varchar(50)=null,
        @Name varchar(50)=null,
        @RelationType varchar(50)=null,
        @Nationality varchar(50)=null,
        @FatherName varchar(50)=null,
        @Address varchar(50)=null,
        @MobileNumber varchar(50)=null,
        @IdentificationMark varchar(50)=null,
        @SecurityClearance varchar(50)=null,
        @ValidityFrom date=null,
        @ValidityTo date=null,
        @DOB date=null,
        @Age varchar(50)=null,
        @Gender varchar(50)=null,
        @Occupation varchar(50)=null,
        @NewPhoto image=null,
        @photo nvarchar(50)=null,
        @ClearLevel nvarchar(50)=null,
        @modified_by varchar(50)=null,
        @modified_date datetime=null,
		@AuthType nvarchar(50)=null

--@SID int,      
--@EID int,    
--@FirstName nvarchar(255)=null, 
--@LastName nvarchar(255)=null,  
--@FH nvarchar(255)=null, 
--@CurrAddr nvarchar(255)=null,  
--@PerAddr nvarchar(255)=null,  
--@Caste nvarchar(255)=null,  
--@DOB datetime, 
--@PlaceofWork nvarchar(255)=null,
--@NIC nvarchar(255)=null, 
--@Religion nvarchar(255)=null,  
--@MarkofIdentification nvarchar(255)=null, 
--@Photo  nvarchar(255)=null,  
--@phoneoffice nvarchar(255)=null,
--@phonehome nvarchar(255)=null,
--@mobile nvarchar(255)=null,
--@modified_by bigint,      
--@modified_date datetime ,    
--@NewPhoto image = null   ,
--@validTo date,
--@validFrom date,
--@SeurityClearance varchar(10)=null,
--@clearanaceLevel varchar(10) = null,
--@BCnumber nvarchar(10)=null 
      
AS      
      
BEGIN      
      
 -- SET NOCOUNT ON added to prevent extra result sets from      
      
 -- interfering with SELECT statements.      
      
 SET NOCOUNT ON;      
 
 
 
 UPDATE [dbo].[ResidantGuest]
   SET [EID] = @EID
      ,[CNIC] = @CNIC
      ,[Name] = @Name
      ,[RelationType] = @RelationType
      ,[Nationality] = @Nationality
      ,[FatherName] = @FatherName
      ,[Address] = @Address
      ,[MobileNumber] = @MobileNumber
      ,[IdentificationMark] = @IdentificationMark
      ,[SecurityClearance] = @SecurityClearance
      ,[ValidityFrom] = @ValidityFrom
      ,[ValidityTo] = @ValidityTo
      ,[DOB] = @DOB
      ,[Age] = @Age
      ,[Gender] = @Gender
      ,[Occupation] = @Occupation
      ,[NewPhoto] = case when @NewPhoto is null then NewPhoto else @NewPhoto end
      ,[photo] = case when @Photo is null then Photo else @Photo end
      ,[ClearLevel] = @ClearLevel
      ,[modified_by] = @modified_by
      ,[modified_date] = @modified_date,
	  AuthenticationType = @AuthType
 WHERE GID=@GID     
 --update Servant set       
      
 --FirstName=@FirstName,LastName=@LastName,FatherName=@FH,PerAddr=@PerAddr,DOB=@DOB,      
      
 --PlaceofWork=@PlaceofWork,NIC=@NIC,MarkofIdentification=@MarkofIdentification,Photo=case when @Photo is null then Photo else @Photo end,
 --MobileNumber=@mobile,modified_by=@modified_by,modified_date=@modified_date,
 -- NewPhoto=case when @NewPhoto is null then NewPhoto else @NewPhoto end  ,
 -- ValidityFrom=@validFrom,ValidityTo=@validTo , SecurityClearance=@SeurityClearance, ClearanceLevel=@clearanaceLevel,BCnumber =@BCnumber
 --where SID=@S
      
END




GO
/****** Object:  StoredProcedure [dbo].[NewGetDeviceName]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from mctx_TerminalInfos
--sp_helptext NewGetDeviceName
CREATE PROCEDURE [dbo].[NewGetDeviceName]

	

AS

BEGIN

	Select  [Terminal_ID], [TerminalName]  from mctx_TerminalInfos where Terminal_ID='9' or Terminal_ID='11' or Terminal_ID='1011'

END




GO
/****** Object:  StoredProcedure [dbo].[NewGetMake]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext GetMake
CREATE PROCEDURE [dbo].[NewGetMake]
AS  

BEGIN  

 -- SET NOCOUNT ON added to prevent extra result sets from  

 -- interfering with SELECT statements.  

 SET NOCOUNT ON;  

  

    SELECT  id,TransportMake  FROM win_TransportMake

 

END
select * from win_TransportMake



GO
/****** Object:  StoredProcedure [dbo].[NonResidentAdd]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Wa>    
-- Create date: <Create Date,,>    
-- Description: <Description,,>    
-- =============================================    
CREATE PROCEDURE [dbo].[NonResidentAdd]    
@NRID int output,    
@FirstName nvarchar(40),    
@LastName nvarchar(40),    
@RelName nvarchar(40),    
@CurrAddr nvarchar(100),    
@PerAddr nvarchar(100),    
@NIC nvarchar(15),    
@PhoneHome nvarchar(20),    
@PhoneOffice nvarchar(20),    
@Mobile nvarchar(20),    
@Religion nvarchar(255),    
@Sectt nvarchar(255),    
@Caste nvarchar(255),    
@Education nvarchar(255),    
@Witness1Name nvarchar(255),    
@Witness1Addr nvarchar(255),    
@Witness2Name nvarchar(255),    
@Witness2Addr nvarchar(255),    
@Authority nvarchar(50),    
@DateofEntry datetime,   
@DateofRelease datetime,  
@Firm nvarchar(255),    
@FirmAddr nvarchar(255),    
@Product nvarchar(255),    
@ShopKeeper nvarchar(255),    
@Department nvarchar(255),    
@Market nvarchar(255),    
@photo nvarchar(255),    
@Designation  nvarchar(50),    
@Rel  nvarchar(3),    
@created_by nvarchar(50),    
@created_date datetime,    
@card_prefix nvarchar(50),    
@Rank_ID int,    
@Person_CatID int,  
@NewPhoto image = null      
    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
     
 EXEC dbo.GetMaxID 'NonResident','NRID',@NRID output    
     
    
    
 INSERT INTO NonResident(NRID,CardNumber,FirstName,LastName,RelName,CurrAddr,PerAddr,NIC,PhoneHome,    
   PhoneOffice,Mobile,Religion,Sectt,Caste,Education,Witness1Name,Witness1Addr,Witness2Name,Witness2Addr,    
   Authority,DateofEntry,DateofRelease,Firm,FirmAddr,Product,ShopKeeper,Department,    
   Market,Status,barcode,photo,_Status,Designation,Rel, SponcerdBy, created_by,created_date,Rank_ID,Person_CatID,NewPhoto)    
 values(@NRID,@card_prefix+'-'+CONVERT(varchar,@NRID)+'/'+CONVERT(varchar,YEAR(GETDATE())),@FirstName,@LastName,@RelName,@CurrAddr,@PerAddr,@NIC,@PhoneHome,@PhoneOffice,    
   @Mobile,@Religion,@Sectt,@Caste,@Education,@Witness1Name,@Witness1Addr,@Witness2Name,@Witness2Addr,    
   @Authority,@DateofEntry,@DateofRelease,@Firm,@FirmAddr,@Product,@ShopKeeper,@Department,@Market,    
   'Active','S'+CONVERT(varchar,@NRID),@photo,1,@Designation,@Rel,'',@created_by,@created_date,@Rank_ID,@Person_CatID,@NewPhoto)    
        
     
END




GO
/****** Object:  StoredProcedure [dbo].[NonResidentUpdate]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  <Wa>      
-- Create date: <Create Date,,>      
-- Description: <Description,,>      
-- =============================================      
CREATE PROCEDURE [dbo].[NonResidentUpdate]      
@NRID int output,      
@FirstName nvarchar(40),      
@LastName nvarchar(40),      
@RelName nvarchar(40),      
@CurrAddr nvarchar(100),      
@PerAddr nvarchar(100),      
@NIC nvarchar(15),      
@PhoneHome nvarchar(20),      
@PhoneOffice nvarchar(20),      
@Mobile nvarchar(20),      
@Religion nvarchar(255),      
@Sectt nvarchar(255),      
@Caste nvarchar(255),      
@Education nvarchar(255),      
@Witness1Name nvarchar(255),      
@Witness1Addr nvarchar(255),      
@Witness2Name nvarchar(255),      
@Witness2Addr nvarchar(255),      
@Authority nvarchar(50),      
@DateofEntry datetime,   
@DateofRelease datetime,   
@Firm nvarchar(255),      
@FirmAddr nvarchar(255),      
@Product nvarchar(255),      
@ShopKeeper nvarchar(255),      
@Department nvarchar(255),      
@Market nvarchar(255),      
@photo nvarchar(255),      
@Designation  nvarchar(50),      
@Rel  nvarchar(3),      
@modified_by nvarchar(50),      
@modified_date datetime,      
@Rank_ID int,      
@Person_CatID int,      
@card_prefix nvarchar(50),    
@NewPhoto image = null         
      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
       
      
 update NonResident set      
   FirstName=@FirstName,LastName=@LastName,RelName=@RelName,      
   CurrAddr=@CurrAddr,PerAddr=@PerAddr,NIC=@NIC,PhoneHome=@PhoneHome,PhoneOffice=@PhoneOffice,      
   Mobile=@Mobile,Religion=@Religion,Sectt=@Sectt,Caste=@Caste,Education=@Education,Witness1Name=@Witness1Name,      
   Witness1Addr=@Witness1Addr,Witness2Name=@Witness2Name,Witness2Addr=@Witness2Addr,      
   Authority=@Authority,DateofEntry=@DateofEntry,DateofRelease=@DateofRelease,Firm=@Firm,FirmAddr=@FirmAddr,Product=@Product,      
   ShopKeeper=@ShopKeeper,Department=@Department,Market=@Market,      
   photo=case when @photo is null then photo else @photo end ,  
   Designation=@Designation,Rel=@Rel,modified_by=@modified_by,  
   modified_date=@modified_date,Rank_ID=@Rank_ID,Person_CatID=@Person_CatID,  
   NewPhoto=case when @NewPhoto is null then NewPhoto else @NewPhoto end,      
   CardNumber=@card_prefix+'-'+CONVERT(varchar,@NRID)+'/'+CONVERT(varchar,YEAR(GETDATE()))      
      
      
   where NRID=@NRID      
       
       
END




GO
/****** Object:  StoredProcedure [dbo].[PDI]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext PDI
CREATE  PROCEDURE [dbo].[PDI]

AS
BEGIN
 SET NOCOUNT ON;  

    SELECT  PDI_ID, PDI_Status  FROM UVSS_PDI
	 
END
--SELECT * FROM UVSS_PDI



GO
/****** Object:  StoredProcedure [dbo].[SaveVisterLog]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[SaveVisterLog]







@CNIC varchar(50) = '',







@VISITOR_NAME varchar(50) = '',







@Employee_ID  int  = 0,







@ADDRESS varchar(50) = '',







@DATE varchar(50) = '',







@TIME_IN varchar(50) = '',







@VEHICLE_NUMBER varchar(50) = '',







@DEPARTMENT varchar(50) = '',







@Relations varchar(50) = '',







@Status varchar(50) = '',







@VID int = 0,







@ValiditDate varchar(50) = '',







@UserType varchar(50) = '',







@visit_purpose varchar(50) = '',







@SlipNo int output















as















insert into mctx_visitor(CNIC,







VISITOR_NAME,







Employee_ID,







ADDRESS,







DATE, 







TIME_IN,







VEHICLE_NUMBER,







DEPARTMENT,







Relations,







Status,







VID,







ValiditDate,







Visit_Purpose,







UserType) values(@CNIC,







@VISITOR_NAME,







@Employee_ID,







@ADDRESS,







@DATE, 







@TIME_IN,







@VEHICLE_NUMBER,







@DEPARTMENT,







@Relations,







@Status,







@VID,







@ValiditDate,







@visit_purpose,







@UserType) 







SET @SlipNo = scope_Identity() 



GO
/****** Object:  StoredProcedure [dbo].[SelectCard]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[SelectCard]
	-- Add the parameters for the stored procedure here
@CNIC varchar(20),
@User_Type varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
 Select Card_ID, User_ID, User_Type, RFID, CreatedBy,
 CreatedDate, ModifiedDate, CNIC  from tblUserCard
 where CNIC = @CNIC and User_Type = @User_Type

END




GO
/****** Object:  StoredProcedure [dbo].[SelectCardByRFID]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectCardByRFID]
	-- Add the parameters for the stored procedure here
@RFID varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
 Select Top(1) Card_ID, User_ID, User_Type, RFID, CreatedBy,
 CreatedDate, ModifiedBy ,ModifiedDate, CNIC  from tblUserCard
 where RFID = @RFID order by Card_ID desc

END




GO
/****** Object:  StoredProcedure [dbo].[SelectFinger]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectFinger]
	-- Add the parameters for the stored procedure here
@CNIC varchar(20),
@User_Type varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
 Select tblFingerID, UserID, User_Type, [User_Name], FingerIndex, CreatedBy,
 CreatedDate, ModifiedDate, CNIC  from tbl_Finger
 where CNIC = @CNIC and User_Type = @User_Type

END




GO
/****** Object:  StoredProcedure [dbo].[ServantAdd]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  































-- Author:  <Waqas Baig>  































-- Create date: <16  Feb 2106>  































-- Description: <Description,,>  































-- =============================================  




















CREATE PROCEDURE [dbo].[ServantAdd]  

@SID int output,  

@EID int,  

@BCnumber nvarchar(10)=null,

@FirstName nvarchar(255)=null,  

@LastName nvarchar(255)=null,  

@FH nvarchar(255)=null,  

@PerAddr nvarchar(255)=null,  

@DOB datetime,  

@NIC nvarchar(255)=null,  

@MarkofIdentification nvarchar(255)=null,  

@Photo  nvarchar(255)=null,  

@mobile nvarchar(255)=null,  

@created_by bigint,  

@created_date datetime,

@validTo date,

@validFrom date,

@SeurityClearance varchar(10)=null,

@clearanaceLevel varchar(10) = null,

@AuthType varchar(10) = null,

@NewPhoto image = null   

AS  

BEGIN  

 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  

 --EXEC dbo.GetMaxID 'Servant','SID',@SID output  

   --if (@SID is null)

   --begin
   --set @SID = 1

   --END

 INSERT INTO [dbo].[Servant] 
 (EID,

 FirstName,

 LastName,

 FatherName,

 PerAddr,

 DOB,

 NIC,  

 MarkofIdentification,

 Photo,

 Status,

 _status,

MobileNumber,

 created_by,

 created_date,

 NewPhoto,

 ValidityFrom,

 ValidityTo , 

 SecurityClearance, 

 ClearanceLevel,

 BCnumber,

 AuthenticationType)  

 VALUES ( @EID,

 @FirstName,
 @LastName,

 @FH,

 @PerAddr,

 @DOB,

 @NIC,

@MarkofIdentification,

 @Photo,

 'Active',  

1,

@mobile,















@created_by,















@created_date,















@NewPhoto,















 @validFrom ,







 







  @validTo ,







  







  @SeurityClearance,







  







  @clearanaceLevel,







  







  @BCnumber,







  







   @AuthType)  















END












GO
/****** Object:  StoredProcedure [dbo].[ServantFamilyAdd]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Waqas Baig>  
-- Create date: <18  Feb 2106>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[ServantFamilyAdd]  
@SFID int output,  
@SID int,  
@EID int,  
@FirstName nvarchar(255)=null,  
@LastName nvarchar(255)=null,  
@Profession nvarchar(255)=null,  
@Relation nvarchar(255)=null,  
@NIC nvarchar(255)=null,  
@PlaceofWork nvarchar(255)=null,  
@Photo nvarchar(255)=null,  
@mobile nvarchar(255)=null,  
@created_by bigint,  
@created_date datetime,    
@NewPhoto image = null     
  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    
 EXEC dbo.GetMaxID 'ServantFamily','SFID',@SFID output  
   
  
 INSERT INTO ServantFamily(SFID,SID,EID,CardNumber,FirstName,LastName,Profession,Relation,NIC,PlaceofWork,BarCode,Status,Photo,_status,Mobile,created_by,created_date,NewPhoto)  
  
  
 VALUES (@SFID,@SID,@EID,'SR-'+convert(varchar,@SFID)+'/'+CONVERT(varchar,YEAR(GETDATE())),@FirstName,@LastName,@Profession,@Relation,@NIC,@PlaceofWork,  
 'SR'+convert(varchar,@SFID),'Active',@Photo,1,@Mobile,@created_by,@created_date,@NewPhoto)  
  
      
END




GO
/****** Object:  StoredProcedure [dbo].[ServantFamilyUpdate]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Waqas Baig>    
-- Create date: <18  Feb 2106>    
-- Description: <Description,,>    
-- =============================================    
CREATE PROCEDURE [dbo].[ServantFamilyUpdate]    
@SFID int,    
@SID int,    
@EID int,    
@FirstName nvarchar(255)=null,    
@LastName nvarchar(255)=null,    
@Profession nvarchar(255)=null,    
@Relation nvarchar(255)=null,    
@NIC nvarchar(255)=null,    
@PlaceofWork nvarchar(255)=null,    
@Photo nvarchar(255)=null,    
@mobile nvarchar(255)=null,    
@modified_by bigint,    
@modified_date datetime,  
@NewPhoto image = null      
    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
      
    
 update ServantFamily set    
 FirstName=@FirstName,LastName=@LastName,Profession=@Profession,Relation=@Relation,    
 NIC=@NIC,PlaceofWork=@PlaceofWork,Photo=case when @Photo is null then Photo else @Photo end,
 Mobile=@Mobile,modified_by=@modified_by,modified_date=@modified_date,
 CardNumber='SR-'+convert(varchar,@SFID)+'/'+CONVERT(varchar,YEAR(GETDATE())),
  NewPhoto=case when @NewPhoto is null then NewPhoto else @NewPhoto end    
    
 where SFID=@SFID    
    
     
        
END




GO
/****** Object:  StoredProcedure [dbo].[ServantUpdate]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
      
-- Author:  <Waqas Baig>      
      
-- Create date: <16  Feb 2106>      
      
-- Description: <Description,,>      
      
-- =============================================      
      
CREATE PROCEDURE [dbo].[ServantUpdate]      
      
@SID int,      
@EID int,    
@FirstName nvarchar(255)=null, 
@LastName nvarchar(255)=null,  
@FH nvarchar(255)=null, 
@CurrAddr nvarchar(255)=null,  
@PerAddr nvarchar(255)=null,  
@Caste nvarchar(255)=null,  
@DOB datetime, 
@PlaceofWork nvarchar(255)=null,
@NIC nvarchar(255)=null, 
@Religion nvarchar(255)=null,  
@MarkofIdentification nvarchar(255)=null, 
@Photo  nvarchar(255)=null,  
@phoneoffice nvarchar(255)=null,
@phonehome nvarchar(255)=null,
@mobile nvarchar(255)=null,
@modified_by bigint,      
@modified_date datetime ,    
@NewPhoto image = null   ,
@validTo date,
@validFrom date,
@SeurityClearance varchar(10)=null,
@clearanaceLevel varchar(10) = null,
@AuthType varchar(10) = null,
@BCnumber nvarchar(10)=null 
      
AS      
      
BEGIN      
      
 -- SET NOCOUNT ON added to prevent extra result sets from      
      
 -- interfering with SELECT statements.      
      
 SET NOCOUNT ON;      
      
 update Servant set       
      
 FirstName=@FirstName,LastName=@LastName,FatherName=@FH,PerAddr=@PerAddr,DOB=@DOB,      
      
 PlaceofWork=@PlaceofWork,NIC=@NIC,MarkofIdentification=@MarkofIdentification,Photo=case when @Photo is null then Photo else @Photo end,
 MobileNumber=@mobile,modified_by=@modified_by,modified_date=@modified_date,
  NewPhoto=case when @NewPhoto is null then NewPhoto else @NewPhoto end  ,
  ValidityFrom=@validFrom,ValidityTo=@validTo , SecurityClearance=@SeurityClearance, ClearanceLevel=@clearanaceLevel,BCnumber =@BCnumber
  ,AuthenticationType=@AuthType
 where SID=@SID      
      
      
      
       
      
          
      
END




GO
/****** Object:  StoredProcedure [dbo].[Sp_BloodGroup]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_BloodGroup]
AS
BEGIN

Select * from BloodGroup
END




GO
/****** Object:  StoredProcedure [dbo].[Sp_ClearanceStatus]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ClearanceStatus]

AS

BEGIN



Select * from ClearanceStatus

END

GO
/****** Object:  StoredProcedure [dbo].[Sp_Gender]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Gender]
AS
BEGIN

Select * from Gender
END




GO
/****** Object:  StoredProcedure [dbo].[SP_GetLastRecord]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[SP_GetLastRecord]
	-- Add the parameters for the stored procedure here
@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;
    -- Insert statements for procedure here
	select Dam_Sen_ID from mctx_VisitorLog where [ID] = @ID
END



GO
/****** Object:  StoredProcedure [dbo].[Sp_Section]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Section]
AS
BEGIN

Select * from Section
END




GO
/****** Object:  StoredProcedure [dbo].[SP_UVSSGetLog]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UVSSGetLog]
	-- Add the parameters for the stored procedure here
@LogDate datetime,
@ANPR varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
 SELECT [UVSSID],[LogDate],[LogDateTime],[CameraIP],[Sequence],
 [VehicleNumber],[FOD],[PDI],[Previous],[PreviousPath],[IsHandled],
 [IsDisplayed],[Place_Id]  FROM [tbl_UVSSlog]

 where CONVERT(datetime, LogDateTime) = CONVERT(datetime, @LogDate ) and VehicleNumber = @ANPR

END




GO
/****** Object:  StoredProcedure [dbo].[SP_UVSSGetLogPlace]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UVSSGetLogPlace]
	-- Add the parameters for the stored procedure here
--@LogDate datetime,
@Place_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here

 SELECT top(1) [UVSSID],[LogDate],[LogDateTime],[CameraIP],[Sequence],
 [VehicleNumber],[FOD],[PDI],[Previous],[PreviousPath],[IsHandled],
 [IsDisplayed],[Place_Id]  FROM [tbl_UVSSlog]
 where UVSSID = (Select top(1) Dam_Sen_ID as UVSSLogID from mctx_visitorlog where Gate_Lane = @Place_Id and ishandled <> 1 and isHandledUVSS = 1 and User_Type = 'mctx_VACS' order by ID asc)
END




GO
/****** Object:  StoredProcedure [dbo].[SP_UVSSGetLogPlace1]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UVSSGetLogPlace1]
	-- Add the parameters for the stored procedure here
--@LogDate datetime,
@Place_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here

SELECT top(1) b.*, [UVSSID],[LogDate],[LogDateTime],[CameraIP],[Sequence],
 [VehicleNumber],[FOD],[PDI],[Previous],[PreviousPath],a.[IsHandled],
 a.[IsDisplayed],[Place_Id] FROM mctx_visitorlog b left join
  tbl_UVSSLog a on a.UVSSID = b.Dam_Sen_ID

where Gate_Lane = @Place_Id and b.ishandled <> 1 and User_Type = 'mctx_VACS' order by ID asc
END




GO
/****** Object:  StoredProcedure [dbo].[SP_UVSSGetUVSSLast]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[SP_UVSSGetUVSSLast]
	-- Add the parameters for the stored procedure here
@User_Type varchar(50),
@Place_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;
    -- Insert statements for procedure here
select Top(1) ID from mctx_VisitorLog where User_Type = @User_Type and isHandled <> 1 and isHandledUVSS <> 1 and gate_Lane = @Place_Id order by ID asc
END




GO
/****** Object:  StoredProcedure [dbo].[SP_UVSSGetVisitorLogforLane]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[SP_UVSSGetVisitorLogforLane]
	-- Add the parameters for the stored procedure here
@User_Type varchar(50),
@Place_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;
    -- Insert statements for procedure here
select Top(1) ID from mctx_VisitorLog where User_Type = @User_Type and isHandled <> 1 and isHandledUVSS <> 1 and gate_Lane = @Place_Id order by ID asc
END




GO
/****** Object:  StoredProcedure [dbo].[SP_UVSSLogInsert]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kamran Paracha
-- Create date: 28-04-2021
-- Description:	UVSS Log Insertion
-- =============================================
CREATE PROCEDURE [dbo].[SP_UVSSLogInsert]
	--@UVSSLogID int output,    
	@LogDate date = null,
    @LogDateTime datetime = null,
	@CameraIP varchar(50) = null,
    @Sequence int = null,
    @VehicleNumber varchar(20) = null,
    @FOD tinyint = null,
    @PDI varchar(10) = null,
    @Previous tinyint = null,
    @PreviousPath nvarchar(500) = null,
    @IsHandled bit = null,
    @IsDisplayed bit = null,
    @Place_Id int = 0

-- Add the parameters for the stored procedure here
	
AS
BEGIN
 SET NOCOUNT ON;  
INSERT INTO [NLC_DB].[dbo].[tbl_UVSSlog]
           ([LogDate]
           ,[LogDateTime]
           ,[CameraIP]
           ,[Sequence]
           ,[VehicleNumber]
           ,[FOD]
           ,[PDI]
           ,[Previous]
           ,[PreviousPath]
           ,[IsHandled]
           ,[IsDisplayed]
           ,Place_Id)
     VALUES
	(@LogDate ,
    @LogDateTime ,
	@CameraIP,
    @Sequence ,
    @VehicleNumber ,
    @FOD ,
    @PDI ,
    @Previous ,
    @PreviousPath ,
    @IsHandled ,
    @IsDisplayed,
    @Place_Id)


set nocount off
 --declare @UVSSLogID as int
 --@UVSSLogID =SCOPE_IDENTITY() 
  
 update mctx_visitorlog set Dam_Sen_ID = SCOPE_IDENTITY(), IsHandledUVSS = 1 where ID = (select Top(1) ID from mctx_VisitorLog where User_Type = 'mctx_VACS' and isHandled <> 1 and isHandledUVSS <> 1 and gate_Lane = @Place_Id order by ID asc)
 --return sCOPE_IDENTITY()   
 
END




GO
/****** Object:  StoredProcedure [dbo].[SP_UVSSLogUpdate]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kamran Paracha
-- Create date: 28-04-2021
-- Description:	UVSS Log Insertion
-- =============================================
CREATE PROCEDURE [dbo].[SP_UVSSLogUpdate]
	@UVSSLogID int,    
	@LogDate date = null,
    @LogDateTime datetime = null,
	@CameraIP varchar(50) = null,
    @Sequence int = null,
    @VehicleNumber varchar(20) = null,
    @FOD tinyint = null,
    @PDI varchar(10) = null,
    @Previous tinyint = null,
    @PreviousPath nvarchar(500) = null,
    @IsHandled bit = null,
    @IsDisplayed bit = null,
    @Place_Id int = 0

-- Add the parameters for the stored procedure here
	
AS
BEGIN
 SET NOCOUNT ON;  
UPDATE [dbo].[tbl_UVSSlog]
   SET [LogDate] = @LogDate
      ,[LogDateTime] = @LogDateTime
      ,[CameraIP] = @CameraIP
      ,[Sequence] = @Sequence
      ,[VehicleNumber] = @VehicleNumber
      ,[FOD] = @FOD
      ,[PDI] = @PDI
      ,[Previous] = @Previous
      ,[PreviousPath] = @PreviousPath
      ,[IsHandled] = @IsHandled
      ,[IsDisplayed] = @IsDisplayed
      ,[Place_Id] = @Place_Id
      ,[RevisedDecision] = ''
      ,[RevisedRemarks] = ''
 WHERE UVSSID = @UVSSLogID;



 --set @UVSSLogID=SCOPE_IDENTITY() 
 
 --update mctx_visitorlog set Dam_Sen_ID = SCOPE_IDENTITY(), IsHandledUVSS = 1 where ID = (select Top(1) ID from mctx_VisitorLog where User_Type = 'mctx_VACS' and isHandled <> 1 and isHandledUVSS <> 1 and gate_Lane = @Place_Id order by ID asc)
 --return SCOPE_IDENTITY()   
 
END




GO
/****** Object:  StoredProcedure [dbo].[totalActiveVisitorCount]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[totalActiveVisitorCount]

as

select COUNT(id) as totalActive from mctx_visitor where TIME_OUT is null




GO
/****** Object:  StoredProcedure [dbo].[totalExpiredVisitorCount]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[totalExpiredVisitorCount]







as



select COUNT(id) as totalActive from mctx_visitor where TIME_OUT is null and isexpired = 0



GO
/****** Object:  StoredProcedure [dbo].[TransportAdd]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Waqas>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TransportAdd]
@TCode smallint,
@owner nvarchar(15)=null,
@owner_addr nvarchar(10)=null,
@owner_nic nvarchar(15)=null,
@driver nvarchar(10)=null,
@driver_nic  nvarchar(15)=null,
@Photo  image=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into Transport(TCode,owner,owner_addr,owner_nic,driver,driver_nic,Status,Photo)
	values(@TCode,@owner,@owner_addr,@owner_nic,@driver,@driver_nic,1,@Photo)

END




GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Waqas Baig>  
-- Create date: <14 jan 2016>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[UpdateUser]  
@userId bigint,  
@username NVARCHAR(200),  
@password NVARCHAR(200)=null,  
@firstname NVARCHAR(200),  
@lastname NVARCHAR(200),  
@address NVARCHAR(200)=null,  
@city NVARCHAR(200)=null,  
@phone NVARCHAR(200)=null,  
@mobile NVARCHAR(200)=null,  
@email NVARCHAR(200)=null,  
@phoneNo NVARCHAR(200)=null,  
@RoleId INT,  
@modified_by bigint,  
@modified_date datetime  
  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
 UPDATE users SET username=@username,
 [password]=case when @password ='' then [password] else @password end,
 firstname=@firstname,lastname=@lastname,address=@address,city=@city,  
 phone=@phoneNo,mobile=@mobile,email=@email,RoleId=@RoleId,
 modified_by=@modified_by,modified_date=@modified_date  
 
 WHERE userId=@userId  
  
END




GO
/****** Object:  StoredProcedure [dbo].[ValidateUser]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Waqas Baig>
-- Create date: <15 jan 2016>
-- Description:	<Description,,>
-- =============================================
-- ValidateUser 'ali','ali'
CREATE PROCEDURE [dbo].[ValidateUser]
@UserName nvarchar(100),
@Password nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT userid,username,firstname,lastname,users.isactive,Roles.RoleName 
	FROM users
	JOIN Roles ON Roles.RoleId=users.RoleId
	WHERE username=@UserName and password=@Password

END




GO
/****** Object:  StoredProcedure [dbo].[vehiclesAdd]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Waqas>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[vehiclesAdd]
@vehicleid float,
@employeeid float,
@registrationnumber nvarchar(255)=null,
@make nvarchar(255)=null,
@model nvarchar(255)=null,
@color nvarchar(255)=null,
@ticketnumber nvarchar(255)=null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into vehicles(vehicleid,employeeid,registrationnumber,make,model,color,ticketnumber,status)
	values(@vehicleid,@employeeid,@registrationnumber,@make,@model,@color,@ticketnumber,1)

END




GO
/****** Object:  StoredProcedure [dbo].[VisitorAdd]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Waqas Baig>    
-- Create date: <07 jan 2016>    
-- Description: <Description,,>    
-- =============================================    
CREATE PROCEDURE [dbo].[VisitorAdd]    
@VID smallint out,    
@IssueDt datetime=null,    
@FirstName nvarchar(255)=null,    
@LastName nvarchar(255)=null,    
@Addr nvarchar(255)=null,    
@NIC nvarchar(255)=null,    
@Phone  nvarchar(100)=null,    
@Mobile  nvarchar(255)=null,    
@Profession  nvarchar(30)=null,    
@VisitPurpose  nvarchar(30)=null,    
@VisitDays smallint=null,    
@ReferenceName nvarchar(50)=null,    
@ReferenceAdd  nvarchar(250)=null,    
@Rank nvarchar(50)=null,    
@Relation nvarchar(50)=null,    
@ValidUpto datetime=null,    
@Photo nvarchar(100)=null,    
@created_by bigint,    
@created_date datetime,    
@Designation_ID nvarchar(50)=null,  
@NewPhoto image = null,
@EmpID varchar(10)= null      
    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
 EXEC dbo.GetMaxID 'Visitor','VID',@VID output    
     
    
 INSERT INTO Visitor(VID,IssueDt,FirstName,LastName,CardNo,Addr,NIC,Phone,Mobile,Profession,    
 VisitPurpose,VisitDays,ReferenceName,ReferenceAdd,Rank,Relation,ValidUpto,Photo,BarCode,Status, created_by,created_date,Designation_ID,NewPhoto,EID)    
    
 VALUES(@VID,@IssueDt,@FirstName,@LastName,'VIS-'+CONVERT(varchar,@VID)+'/'+CONVERT(varchar,YEAR(GETDATE())),@Addr,@NIC,@Phone,@Mobile,@Profession,    
 @VisitPurpose,@VisitDays,@ReferenceName,@ReferenceAdd,@Rank,@Relation,@ValidUpto,@Photo,'V'+CONVERT(varchar,@VID),'Active',@created_by,@created_date,@Designation_ID,@NewPhoto,@EmpID)    
        
    
END




GO
/****** Object:  StoredProcedure [dbo].[VisitorUpdate]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  <Waqas Baig>      
-- Create date: <07 jan 2016>      
-- Description: <Description,,>      
-- =============================================      
CREATE PROCEDURE [dbo].[VisitorUpdate]      
@VID smallint out,      
@IssueDt datetime=null,      
@FirstName nvarchar(255)=null,      
@LastName nvarchar(255)=null,      
@Addr nvarchar(255)=null,      
@NIC nvarchar(255)=null,      
@Phone  nvarchar(100)=null,      
@Mobile  nvarchar(255)=null,      
@Profession  nvarchar(30)=null,      
@VisitPurpose  nvarchar(30)=null,      
@VisitDays smallint=null,      
@ReferenceName nvarchar(50)=null,      
@ReferenceAdd  nvarchar(250)=null,      
@Rank nvarchar(50)=null,      
@Relation nvarchar(50)=null,      
@ValidUpto datetime=null,      
@Photo nvarchar(100)=null,      
@modified_by bigint,      
@modified_date datetime,      
@Designation_ID nvarchar(50)=null,    
@NewPhoto image = null,
@EmpID varchar(10)= null           
      
      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
      
      
 update Visitor set      
 VID=@VID,IssueDt=@IssueDt,FirstName=@FirstName,LastName=@LastName      
 ,Addr=@Addr,NIC=@NIC,Phone=@Phone,Mobile=@Mobile,Profession=@Profession,VisitPurpose=@VisitPurpose,      
 VisitDays=@VisitDays,ReferenceName=@ReferenceName,ReferenceAdd=@ReferenceAdd,Rank=@Rank,      
 Relation=@Relation,ValidUpto=@ValidUpto,  
 Photo=case when @Photo is null then Photo else @Photo end,  
 modified_by=@modified_by,modified_date=@modified_date,       
 Designation_ID=@Designation_ID,   
 CardNo='VIS-'+CONVERT(varchar,@VID)+'/'+CONVERT(varchar,YEAR(GETDATE())) ,
 NewPhoto=case when @NewPhoto is null then NewPhoto else @NewPhoto end, 
  EID=@EmpID    
          
 where VID=@VID      
END




GO
/****** Object:  StoredProcedure [dbo].[win_LoadBusinessCommunities]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[win_LoadBusinessCommunities]
	
AS
BEGIN
	select id , name from mctx_BusinessCommunityDetail
END




GO
/****** Object:  StoredProcedure [dbo].[win_LoadEmployee]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[win_LoadEmployee]
	
AS
BEGIN
	select Eid as id, Firstname+' '+LastName name from employee
END




GO
/****** Object:  StoredProcedure [dbo].[win_LoadEmployee1]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[win_LoadEmployee1]
	
AS
BEGIN
	select NIC as id, Firstname+' '+LastName as name, ServiceNo from employee order by name asc
END



GO
/****** Object:  StoredProcedure [dbo].[win_LoadEmployeeFamily]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[win_LoadEmployeeFamily]
	
AS
BEGIN
	select Efid as id , firstname +' '+LastName name from EmployeeFamily
END




GO
/****** Object:  StoredProcedure [dbo].[win_LoadEmployees]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[win_LoadEmployees]
AS
BEGIN
select 0 as id , '--Select--' name
END




GO
/****** Object:  StoredProcedure [dbo].[win_LoadTransportBodyType]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[win_LoadTransportBodyType]
	
AS
BEGIN
	select * from win_TransportBodyType
END




GO
/****** Object:  StoredProcedure [dbo].[win_LoadTransportColour]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[win_LoadTransportColour]
	
AS
BEGIN
	select * from win_TransportColour
END




GO
/****** Object:  StoredProcedure [dbo].[win_LoadTransportMake]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[win_LoadTransportMake]
	
AS
BEGIN
	select * from win_TransportMake
END




GO
/****** Object:  StoredProcedure [dbo].[Z_GetEmployeeReportWithMultilpleFilters]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
----Author:Zeeshan Bangash  
----exec Z_GetEmployeeReportWithMultilpleFilters 'GET','','','khan','','','','','','','','','2021-01-25','2021-01-25'
----exec Z_GetEmployeeReportWithMultilpleFilters @status,@PNo,@CNIC,@Name,@Department,@Designation,@Rank,@Gender,@ClearanceStatus,@GateNo,@GateLane,@DeviceName,@DateFrom,@DateTo
----exec Z_GetEmployeeReportWithMultilpleFilters 'GET','333'  				 
----Dynamic sql in stored procedure for filter records using multiple parameter  
--EXEC dbo.Z_GetEmployeeReportWithMultilpleFilters @PNo='333', @status='GET'
  
CREATE PROCEDURE [dbo].[Z_GetEmployeeReportWithMultilpleFilters]  
		@status varchar(10),
		@PNo VARCHAR(10)=null,
		@CNIC VARCHAR(20)=null,
		@Name VARCHAR(30)=null,
		@Department INT=null,
		@Designation INT=null,
		@Rank INT=null,
		@Gender INT=null,
		@ClearanceStatus INT=null,
		@GateNo INT=null,
		@GateLane INT=null,
		@DeviceName INT=null,
		@DateFrom VARCHAR(30)=null,
		@DateTo VARCHAR(30)=null
		--@name nvarchar(max)=null  
		
AS  
BEGIN  
if @status='GET'  
BEGIN  
    Set NoCount ON  
Declare @SQLQuery AS NVarchar(max)  
Declare @ParamDefinition AS NVarchar(max)  
Declare @UserType as varchar(10)
SET @UserType='Employee' 
    Set @SQLQuery ='SELECT VID, vl.[DATE], emp.ServiceNo, emp.FirstName + emp.LastName as Full_Name, emp.Nic, emp.FatherName, dep.Department_Name, deg.designation, rk.Rank_Name, 
g.GenderName, cs.ClearanceStatusName as Clearance_Status, TIME_IN, TIME_OUT, psa.Site_Name, emp.ValidUpto, VEHICLE_NUMBER, gt.Gate_Name, p.LocationName as Gate_Lane, User_Type, wd.ID, ti.TerminalName + wd.DeviceName as Device_Name,Remarks 
FROM 
mctx_visitorlog vl
LEFT JOIN dbo.Employee emp ON emp.EID=vl.VID
LEFT JOIN dbo.mctx_Department dep ON dep.Department_ID=emp.Department
LEFT JOIN dbo.HR_Designation deg ON deg.Designation_ID=emp.Designation
LEFT JOIN dbo.mctx_Ranks rk ON rk.Rank_ID=emp.[Rank]
LEFT JOIN dbo.Gender g ON g.ID=emp.Gender
LEFT JOIN dbo.ClearanceStatus cs ON cs.ID=emp.ClearanceStatus
LEFT JOIN dbo.mctx_PersonSiteAllowed psa ON psa.ID=emp.ClearanceLevel
LEFT JOIN dbo.mctx_Gates gt ON gt.Gate_ID=vl.GATE_NUMBER
LEFT JOIN dbo.mctx_Wiegand_Devices wd ON wd.ID=vl.TerminalID
LEFT JOIN dbo.mctx_TerminalInfos ti ON ti.Terminal_ID=wd.Terminal_ID
LEFT JOIN dbo.Place p ON p.ID=vl.Gate_Lane
WHERE vl.User_Type =@UserType '  
    If (@PNo Is Not Null) AND (@PNo<>'')  
         Set @SQLQuery = @SQLQuery + ' And (emp.ServiceNo=@PNo)'  
  
    If (@CNIC Is Not Null) and (@CNIC <> '')  
    Set @SQLQuery = @SQLQuery + ' And emp.Nic=@CNIC' 
	
	If (@Name Is Not Null) and (@Name <> '')  
    Set @SQLQuery = @SQLQuery + ' And emp.FirstName + emp.LastName LIKE '''+ '%' + @Name + '%' + ''''  
  
    If (@Department Is Not Null) and (@Department <> 0)  
    Set @SQLQuery = @SQLQuery + ' And emp.Department=@Department'
	
	If (@Designation Is Not Null) and (@Designation <> 0)  
    Set @SQLQuery = @SQLQuery + ' And emp.Designation=@Designation'
	
	If (@Rank Is Not Null) and (@Rank <> 0)  
    Set @SQLQuery = @SQLQuery + ' And emp.[Rank]=@Rank'
	
	If (@Gender Is Not Null) and (@Gender <> 0)  
    Set @SQLQuery = @SQLQuery + ' And emp.Gender=@Gender'

	If (@ClearanceStatus Is Not Null) and (@ClearanceStatus <> 0)  
    Set @SQLQuery = @SQLQuery + ' And emp.ClearanceStatus=@ClearanceStatus'

	If (@GateNo Is Not Null) and (@GateNo <> 0)  
    Set @SQLQuery = @SQLQuery + ' And vl.GATE_NUMBER=@GateNo'

	If (@GateLane Is Not Null) and (@GateLane <> 0)  
    Set @SQLQuery = @SQLQuery + ' And vl.Gate_Lane=@GateLane'

	If (@DeviceName Is Not Null) and (@DeviceName <> 0)  
    Set @SQLQuery = @SQLQuery + ' And vl.TerminalID=@DeviceName'

	If (@DateFrom Is Not Null) AND (@DateTo Is Not Null)  
         Set @SQLQuery = @SQLQuery + ' And (vl.[DATE] BETWEEN @DateFrom AND @DateTo)'
 
         Set @ParamDefinition = '@PNo VARCHAR(10),@CNIC VARCHAR(20),@Name VARCHAR(30),@Department INT,@Designation INT,@Rank INT,@Gender INT,@ClearanceStatus INT,@GateNo INT,@GateLane INT,@DeviceName INT,@DateFrom varchar(30),@DateTo varchar(30),@UserType varchar(10)'  
         Execute sp_Executesql     @SQLQuery,@ParamDefinition,@PNo,@CNIC,@Name,@Department,@Designation,@Rank,@Gender,@ClearanceStatus,@GateNo,@GateLane,@DeviceName,@DateFrom,@DateTo,@UserType  			  
 
	END  																									  
END 																										  

																								  																										  
																											  
																											  
																											  	    



GO
/****** Object:  StoredProcedure [dbo].[Z_GetUVSSReportWithMultilpleFilters]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
----Author:Zeeshan Bangash  
----exec Z_GetUVSSReportWithMultilpleFilters 'GET','','','','','2021-02-09','2021-02-09'
----exec Z_GetUVSSReportWithMultilpleFilters @status,@VehicleNO,@FOD,@PDI,@Lane,@DateFrom,@DateTo
----Dynamic sql in stored procedure for filter records using multiple parameter
  
CREATE PROCEDURE [dbo].[Z_GetUVSSReportWithMultilpleFilters]  
		@status varchar(10),
		@VehicleNO VARCHAR(20)=null,
		@FOD INT=-1,
		@PDI INT=-1,
		@Lane INT=null,
		@DateFrom VARCHAR(30)=null,
		@DateTo	VARCHAR(30)=null		
		
AS  
BEGIN  
if @status='GET'  
BEGIN  
    Set NoCount ON  
Declare @SQLQuery AS NVarchar(max)  
Declare @ParamDefinition AS NVarchar(max)  
Declare @UserType as varchar(10)
    Set @SQLQuery =' select ul.LogDate, ul.LogDateTime, ul.VehicleNumber, ufd.FOD_Status, upd.PDI_Status, up.Previous_Status, p.LocationName, ul.RevisedDecision, ul.RevisedRemarks  
from tbl_UVSSlog ul
LEFT JOIN UVSS_FOD ufd ON ufd.FOD_ID=ul.FOD
LEFT JOIN UVSS_PDI upd ON upd.PDI_ID=ul.PDI
LEFT JOIN UVSS_Previous up ON up.Previous_ID=ul.Previous
LEFT JOIN Place p ON p.ID=ul.Place_Id
WHERE UVSSID <> 0 '  
	If (@VehicleNO Is Not Null) AND (@VehicleNO<>'')  
         Set @SQLQuery = @SQLQuery + ' And (ul.VehicleNumber=@VehicleNO)'

    If (@FOD Is Not Null)  and (@FOD <> -1)
         Set @SQLQuery = @SQLQuery + ' And (ul.FOD=@FOD)'  
  
    If (@PDI Is Not Null) and (@PDI <> -1)  
    Set @SQLQuery = @SQLQuery + ' And ul.PDI=@PDI' --LIKE '''+ '%' + @name + '%' + ''''  

	If (@Lane Is Not Null) and (@Lane <> 0)  
    Set @SQLQuery = @SQLQuery + ' And ul.Place_Id=@Lane'

	If (@DateFrom Is Not Null) AND (@DateTo Is Not Null)  
         Set @SQLQuery = @SQLQuery + ' And (ul.LogDate BETWEEN @DateFrom AND @DateTo)'
 
         Set @ParamDefinition = '@VehicleNO VARCHAR(20),@FOD INT,@PDI INT,@Lane INT,@DateFrom varchar(30),@DateTo varchar(30)'  
         Execute sp_Executesql   @SQLQuery,@ParamDefinition,@VehicleNO,@FOD,@PDI,@Lane,@DateFrom,@DateTo  			  

	END  																									  
END 



GO
/****** Object:  StoredProcedure [dbo].[Z_GetVacsReportWithMultilpleFilters]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
----Author:Zeeshan Bangash  
----exec Z_GetVacsReportWithMultilpleFilters 'GET','vu-691','333','6110171654650','1','5','Private','1','3','11','2020-08-25','2021-09-09'
----exec Z_GetVacsReportWithMultilpleFilters @status,@VehicleNO,@PNo,@CNIC,@ClearanceStatus,@Make,@VehicleType,@GateNo,@GateLane,@DeviceName,@DateFrom,@DateTo
----exec Z_GetVacsReportWithMultilpleFilters 'GET','333'  				 
----Dynamic sql in stored procedure for filter records using multiple parameter
  
CREATE PROCEDURE [dbo].[Z_GetVacsReportWithMultilpleFilters]  
		@status varchar(10),
		@VehicleNO VARCHAR(20)=null,
		@Pno VARCHAR(20)=null,
		@CNIC VARCHAR(20)=null,
		@ClearanceStatus INT=null,
		@Make INT=null,
		@VehicleType VARCHAR(20)=null,
		@GateNo	INT=null,
		@GateLane INT=null,
		@DeviceName INT=null,
		@DateFrom VARCHAR(30)=null,
		@DateTo	VARCHAR(30)=null
		--@name nvarchar(max)=null  
		
AS  
BEGIN  
if @status='GET'  
BEGIN  
    Set NoCount ON  
Declare @SQLQuery AS NVarchar(max)  
Declare @ParamDefinition AS NVarchar(max)  
Declare @UserType as varchar(10)
SET @UserType='mctx_VACS'
    Set @SQLQuery =' SELECT VID, vl.[DATE], vac.VehicleNo, tm.TransportMake as Make, tbt.TransportBodyType as Body_Type, vac.Model, tc.TransportColour as Colour, vac.VehicleType, vac.EMP_Type, TIME_IN, TIME_OUT, cs.ClearanceStatusName as Clearance_Status, psa.Site_Name as Site_Allowed, 
emp.ServiceNo, emp.FirstName + emp.LastName as Full_Name, vac.CNIC, dep.Department_Name, deg.designation, rk.Rank_Name, 
g.GenderName, gt.Gate_Name, p.LocationName as Gate_Lane, User_Type, wd.ID, ti.TerminalName + wd.DeviceName as Device_Name,Remarks 
FROM 
mctx_visitorlog vl
LEFT JOIN dbo.mctx_VACS vac ON vac.VACS_ID=vl.VID
LEFT JOIN dbo.Employee emp ON emp.EID=vac.EMP_ID
LEFT JOIN dbo.mctx_Department dep ON dep.Department_ID=emp.Department
LEFT JOIN dbo.HR_Designation deg ON deg.Designation_ID=emp.Designation
LEFT JOIN dbo.mctx_Ranks rk ON rk.Rank_ID=emp.[Rank]
LEFT JOIN dbo.Gender g ON g.ID=emp.Gender
LEFT JOIN dbo.mctx_PersonSiteAllowed psa ON psa.ID=vac.VehicleClearanceLevel
LEFT JOIN dbo.ClearanceStatus cs ON cs.ID=vac.VehicleClearanceStatus
LEFT JOIN dbo.mctx_Gates gt ON gt.Gate_ID=vl.GATE_NUMBER
LEFT JOIN dbo.mctx_Wiegand_Devices wd ON wd.ID=vl.TerminalID
LEFT JOIN dbo.mctx_TerminalInfos ti ON ti.Terminal_ID=wd.Terminal_ID
LEFT JOIN dbo.Place p ON p.ID=vl.Gate_Lane
LEFT JOIN dbo.win_TransportBodyType tbt ON tbt.id=vac.BodyType
LEFT JOIN dbo.win_TransportColour tc ON tc.id=vac.Colour
LEFT JOIN dbo.win_TransportMake tm ON tm.id=vac.Make
WHERE vl.User_Type =@UserType '  
	If (@VehicleNO Is Not Null) AND (@VehicleNO<>'')  
         Set @SQLQuery = @SQLQuery + ' And (vac.VehicleNo=@VehicleNO)'

    If (@PNo Is Not Null) AND (@PNo<>'')  
         Set @SQLQuery = @SQLQuery + ' And (emp.ServiceNo=@PNo)'  
  
    If (@CNIC Is Not Null) and (@CNIC <> '')  
    Set @SQLQuery = @SQLQuery + ' And emp.Nic=@CNIC' --LIKE '''+ '%' + @name + '%' + ''''  
  
    If (@ClearanceStatus Is Not Null) and (@ClearanceStatus <> 0)  
    Set @SQLQuery = @SQLQuery + ' And vac.VehicleClearanceStatus=@ClearanceStatus'
	
	If (@Make Is Not Null) and (@Make <> 0)  
    Set @SQLQuery = @SQLQuery + ' And vac.Make=@Make'
	
	If (@VehicleType Is Not Null) and (@VehicleType <>'')  
    Set @SQLQuery = @SQLQuery + ' And vac.VehicleType=@VehicleType'
	
	--If (@Gender Is Not Null) and (@Gender <> 0)  
 --   Set @SQLQuery = @SQLQuery + ' And emp.Gender=@Gender'

	If (@GateNo Is Not Null) and (@GateNo <> 0)  
    Set @SQLQuery = @SQLQuery + ' And vl.GATE_NUMBER=@GateNo'

	If (@GateLane Is Not Null) and (@GateLane <> 0)  
    Set @SQLQuery = @SQLQuery + ' And vl.Gate_Lane=@GateLane'

	If (@DeviceName Is Not Null) and (@DeviceName <> 0)  
    Set @SQLQuery = @SQLQuery + ' And vl.TerminalID=@DeviceName'

	If (@DateFrom Is Not Null) AND (@DateTo Is Not Null)  
         Set @SQLQuery = @SQLQuery + ' And (vl.[DATE] BETWEEN @DateFrom AND @DateTo)'
 
         Set @ParamDefinition = '@VehicleNO VARCHAR(20),@Pno VARCHAR(20),@CNIC VARCHAR(20),@ClearanceStatus INT,@Make INT,@VehicleType VARCHAR(20),@GateNo	INT,@GateLane INT,@DeviceName INT,@DateFrom varchar(30),@DateTo varchar(30),@UserType varchar(10)'  
         Execute sp_Executesql   @SQLQuery,@ParamDefinition,@VehicleNO,@Pno,@CNIC,@ClearanceStatus,@Make,@VehicleType,@GateNo,@GateLane,@DeviceName,@DateFrom,@DateTo,@UserType  			  

	END  																									  
END 



GO
/****** Object:  Table [dbo].[_users]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_users](
	[userid] [float] NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[firstname] [nvarchar](255) NULL,
	[lastname] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[mobile] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[RoleId] [int] NULL,
	[UserType] [varchar](50) NULL,
	[created_by] [bigint] NULL,
	[created_date] [datetime] NULL,
	[modified_by] [bigint] NULL,
	[modified_date] [datetime] NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK__aspnet_A__C93A4C984E88ABD4] PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__aspnet_A__17477DE44BAC3F29] UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__aspnet_A__3091033148CFD27E] UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK__aspnet_M__1788CC4D44CA3770] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK__aspnet_P__CD67DC5803F0984C] PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_P__CD67DC593D2915A8] PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_P__3214EC0640F9A68C] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_P__1788CC4C367C1819] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK__aspnet_R__8AFACE1B0B91BA14] PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
 CONSTRAINT [PK__aspnet_S__5A1E6BC1412EB0B6] PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_U__1788CC4D7D439ABD] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__aspnet_U__AF2760AD498EEC8D] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
 CONSTRAINT [PK__aspnet_W__7944C8105629CD9C] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BloodGroup]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BloodGroupName] [nvarchar](50) NULL,
 CONSTRAINT [PK_BloodGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CardColor]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CardColor](
	[CardColor_ID] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [varchar](50) NULL,
 CONSTRAINT [PK_CardColor] PRIMARY KEY CLUSTERED 
(
	[CardColor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClearanceStatus]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClearanceStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClearanceStatusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ClearanceStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Counters]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Counters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NULL,
	[ColumnName] [varchar](50) NULL,
	[Counter] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceNo] [nvarchar](255) NULL,
	[Rank] [int] NULL,
	[ValidUpto] [datetime] NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[CurrAddr] [nvarchar](255) NULL,
	[PerAddr] [nvarchar](255) NULL,
	[Nic] [float] NOT NULL,
	[PhoneHome] [nvarchar](50) NULL,
	[PhoneOffice] [nvarchar](255) NULL,
	[Mobile] [nvarchar](255) NULL,
	[Department] [int] NULL,
	[Designation] [int] NULL,
	[Dob] [date] NULL,
	[Gender] [int] NULL,
	[_photo] [image] NULL,
	[Photo] [nvarchar](255) NULL,
	[FatherName] [varchar](50) NULL,
	[MotherName] [varchar](50) NULL,
	[BloodGroup] [varchar](50) NULL,
	[Cadre] [int] NULL,
	[CardColor] [int] NULL,
	[ResidantStatus] [int] NULL,
	[Transport] [int] NULL,
	[Section] [varchar](50) NULL,
	[ClearanceStatus] [varchar](10) NULL,
	[ClearanceLevel] [int] NULL,
	[IdentificationMark] [varchar](50) NULL,
	[created_by] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](50) NULL,
	[modified_date] [datetime] NULL,
	[RFID] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[_status] [bit] NULL,
	[AuthenticationType] [int] NULL,
	[NewPhoto] [image] NULL,
	[Remarks] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Nic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeFamily]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeFamily](
	[EFID] [smallint] IDENTITY(1,1) NOT NULL,
	[EID] [int] NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Relation] [nvarchar](255) NULL,
	[NIC] [varchar](50) NOT NULL,
	[Mobile] [nvarchar](255) NULL,
	[_photo] [image] NULL,
	[Photo] [nvarchar](255) NULL,
	[vaddr] [nvarchar](80) NULL,
	[DateOfBirth] [date] NULL,
	[address] [nvarchar](50) NULL,
	[FamilyGender] [int] NULL,
	[ValidFrom] [date] NULL,
	[ValidTo] [date] NULL,
	[AuthenticationType] [int] NULL,
	[ClearanceLevel] [int] NULL,
	[SecurityClearance] [varchar](50) NULL,
	[created_by] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](50) NULL,
	[modified_date] [datetime] NULL,
	[isHandled] [tinyint] NULL,
	[RFID] [nvarchar](50) NULL,
	[NewPhoto] [image] NULL,
	[Status] [nvarchar](10) NULL,
	[_status] [bit] NULL,
 CONSTRAINT [PK_EmployeeFamily] PRIMARY KEY CLUSTERED 
(
	[NIC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeLog]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLog](
	[EID] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Id] [int] NULL,
	[ServiceNo] [nvarchar](225) NULL,
	[Rank] [int] NULL,
	[ValidUpto] [datetime] NULL,
	[FirstName] [nvarchar](225) NULL,
	[LastName] [nvarchar](225) NULL,
	[Nic] [nvarchar](225) NULL,
	[Department] [int] NULL,
	[Designation] [int] NULL,
	[Cadre] [int] NULL,
	[Transport] [int] NULL,
	[ClearanceStatus] [int] NULL,
	[ClearanceLevel] [int] NULL,
 CONSTRAINT [PK_EmployeeLog] PRIMARY KEY CLUSTERED 
(
	[EID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gender]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gender](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [varchar](50) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HR_Designation]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HR_Designation](
	[Designation_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[designation] [nvarchar](250) NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[is_deleted] [bit] NULL,
	[Person_CateID] [int] NULL,
 CONSTRAINT [PK_HR_Designation] PRIMARY KEY CLUSTERED 
(
	[Designation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Is_Authorised]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is_Authorised](
	[Is_Auth_Id] [int] IDENTITY(1,1) NOT NULL,
	[Is_Authorised_Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Is_Authorised] PRIMARY KEY CLUSTERED 
(
	[Is_Auth_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KRL_Transport]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KRL_Transport](
	[Transport_ID] [int] IDENTITY(1,1) NOT NULL,
	[Transport_Name] [varchar](50) NULL,
 CONSTRAINT [PK_KRL_Transport] PRIMARY KEY CLUSTERED 
(
	[Transport_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[List$]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[List$](
	[HR#No#] [float] NULL,
	[Rank] [nvarchar](255) NULL,
	[ValidUpto] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[CNIC] [float] NULL,
	[Mobile No] [nvarchar](255) NULL,
	[Department/Branch] [nvarchar](255) NULL,
	[Appointment] [nvarchar](255) NULL,
	[Gender] [nvarchar](255) NULL,
	[Photo] [nvarchar](255) NULL,
	[ClearanceStatus] [float] NULL,
	[created_by] [nvarchar](255) NULL,
	[created_date] [nvarchar](255) NULL,
	[modified_by] [nvarchar](255) NULL,
	[modified_date] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[_status] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mctx_BusinessCommunity]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mctx_BusinessCommunity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessName] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifyBy] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_mctx_BusinessCommunity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mctx_BusinessCommunityDetail]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_BusinessCommunityDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CNIC] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[Gender] [int] NULL,
	[DOB] [date] NULL,
	[address] [varchar](50) NULL,
	[FatherName] [varchar](50) NULL,
	[IdentificationMark] [varchar](50) NULL,
	[BloodGroup] [varchar](50) NULL,
	[ValidityFrom] [varchar](50) NULL,
	[ValidityTo] [varchar](50) NULL,
	[BusinessCommunityCategory] [int] NULL,
	[Designation] [varchar](50) NULL,
	[NewPhoto] [image] NULL,
	[CStatus] [nvarchar](50) NULL,
	[ClearanceLevel] [int] NULL,
	[ClearanceStatus] [int] NULL,
	[Photo] [nvarchar](50) NULL,
	[created_by] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](50) NULL,
	[modified_date] [datetime] NULL,
	[AuthenticationType] [int] NULL,
 CONSTRAINT [PK_mctx_BusinessCommunityDetail] PRIMARY KEY CLUSTERED 
(
	[CNIC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_Cadre]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_Cadre](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Cadre_Name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_Caste]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_Caste](
	[Caste_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Caste_Name] [varchar](50) NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_mctx_Caste] PRIMARY KEY CLUSTERED 
(
	[Caste_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_ClientMachinesInfo]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_ClientMachinesInfo](
	[Client_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Client_IP] [varchar](50) NULL,
	[Terminal_Type_ID] [int] NULL,
	[Gate_ID] [int] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_mctx_ClientMachinesInfo1] PRIMARY KEY CLUSTERED 
(
	[Client_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_ClientMachinesInfo_]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_ClientMachinesInfo_](
	[Client_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Client_IP] [varchar](50) NULL,
	[Terminal_Type_ID] [int] NULL,
	[Gate_ID] [int] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_mctx_ClientMachinesInfo] PRIMARY KEY CLUSTERED 
(
	[Client_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_ContractorInformation]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_ContractorInformation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirmName] [varchar](50) NULL,
	[ContractorName] [varchar](50) NULL,
	[Gender] [int] NULL,
	[CNIC] [varchar](50) NULL,
	[FirmAddress] [varchar](50) NULL,
	[ResidantAddress] [varchar](50) NULL,
	[MobileNo] [varchar](50) NULL,
	[OfficeNumber] [varchar](50) NULL,
	[IdentificationMark] [varchar](50) NULL,
	[RankOrAppointment] [varchar](50) NULL,
	[Photo] [nvarchar](100) NULL,
	[created_by] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](50) NULL,
	[modified_date] [datetime] NULL,
	[CStatus] [nvarchar](50) NULL,
	[NewPhoto] [image] NULL,
	[ValidityFrom] [date] NULL,
	[ValidityTo] [date] NULL,
	[ClearanceLevel] [int] NULL,
	[ClearanceStatus] [int] NULL,
	[AuthenticationType] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_ContractorLaborInformation]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_ContractorLaborInformation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ContractorName] [int] NULL,
	[FirmName] [nvarchar](50) NULL,
	[LaborName] [nvarchar](50) NULL,
	[Gender] [int] NULL,
	[CNIC] [varchar](50) NOT NULL,
	[IdentificationMark] [nvarchar](50) NULL,
	[Placeofwork] [nvarchar](50) NULL,
	[address] [varchar](50) NULL,
	[MobileNumber] [varchar](50) NULL,
	[Photo] [nvarchar](50) NULL,
	[created_by] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](50) NULL,
	[modified_date] [datetime] NULL,
	[ClearanceStatus] [int] NULL,
	[ClearanceLevel] [int] NULL,
	[ValidFrom] [date] NULL,
	[ValidTo] [date] NULL,
	[CStatus] [nvarchar](50) NULL,
	[NewPhoto] [image] NULL,
	[AuthenticationType] [int] NULL,
 CONSTRAINT [PK_mctx_ContractorLaborInformation] PRIMARY KEY CLUSTERED 
(
	[CNIC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_Department]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_Department](
	[Department_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Department_Name] [varchar](50) NULL,
	[Dept_ABR] [varchar](50) NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[is_deleted] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_Education]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_Education](
	[Education_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Education_Name] [varchar](50) NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_mctx_Education] PRIMARY KEY CLUSTERED 
(
	[Education_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_FamilyCategory]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mctx_FamilyCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FamilyCategoryName] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifyBy] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[is_deleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mctx_Gates]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_Gates](
	[Gate_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Gate_Name] [varchar](50) NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_mctx_Gates] PRIMARY KEY CLUSTERED 
(
	[Gate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_PersonSiteAllowed]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_PersonSiteAllowed](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Site_Name] [nvarchar](50) NULL,
	[Site_Prefix] [varchar](50) NULL,
 CONSTRAINT [PK_mctx_PersonSiteAllowed] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_Ranks]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_Ranks](
	[Rank_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Rank_Name] [nvarchar](50) NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[is_deleted] [bit] NULL,
	[Person_CateID] [int] NULL,
 CONSTRAINT [PK_mctx_Ranks] PRIMARY KEY CLUSTERED 
(
	[Rank_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_Rasidant_Status]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_Rasidant_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Rasidant_Status_Name] [varchar](50) NULL,
 CONSTRAINT [PK_mctx_Rasidant_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_Relation]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_Relation](
	[Relation_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Relation_Name] [varchar](50) NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_mctx_Relation] PRIMARY KEY CLUSTERED 
(
	[Relation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_Religion]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_Religion](
	[Religion_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Religion_Name] [varchar](50) NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_mctx_Religion] PRIMARY KEY CLUSTERED 
(
	[Religion_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_Sectt]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_Sectt](
	[Sectt_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Sectt_Name] [varchar](50) NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_mctx_Sectt] PRIMARY KEY CLUSTERED 
(
	[Sectt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_TerminalInfos]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_TerminalInfos](
	[Terminal_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Terminal_Type_ID] [int] NULL,
	[Terminal_IP] [varchar](50) NULL,
	[DeviceID] [varchar](50) NULL,
	[PortNo] [varchar](50) NULL,
	[Client_ID] [int] NULL,
	[Gate_ID] [int] NULL,
	[TerminalName] [varchar](50) NULL,
	[Controller] [varchar](50) NULL,
	[Is_Handled] [bit] NULL,
 CONSTRAINT [PK_mctx_TerminalInfos1] PRIMARY KEY CLUSTERED 
(
	[Terminal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_TerminalInfos_]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_TerminalInfos_](
	[Terminal_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Terminal_Type_ID] [int] NULL,
	[Terminal_IP] [varchar](50) NULL,
	[DeviceID] [varchar](50) NULL,
	[PortNo] [varchar](50) NULL,
	[Client_ID] [int] NULL,
	[Gate_ID] [int] NULL,
	[TerminalName] [varchar](50) NULL,
	[Controller] [varchar](50) NULL,
	[Is_Handled] [bit] NULL,
 CONSTRAINT [PK_mctx_TerminalInfos] PRIMARY KEY CLUSTERED 
(
	[Terminal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_TerminalInfos2]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_TerminalInfos2](
	[Terminal_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Terminal_Type_ID] [int] NULL,
	[Terminal_IP] [varchar](50) NULL,
	[DeviceID] [varchar](50) NULL,
	[PortNo] [varchar](50) NULL,
	[Client_ID] [int] NULL,
	[Gate_ID] [int] NULL,
	[TerminalName] [varchar](50) NULL,
	[Controller] [varchar](50) NULL,
	[Is_Handled] [bit] NULL,
 CONSTRAINT [PK_mctx_TerminalInfos2] PRIMARY KEY CLUSTERED 
(
	[Terminal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_TerminalType]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_TerminalType](
	[Terminal_Type_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Terminal_type] [varchar](50) NULL,
 CONSTRAINT [PK_mctx_TerminalType] PRIMARY KEY CLUSTERED 
(
	[Terminal_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_VACS]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_VACS](
	[VACS_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[EMP_ID] [int] NULL,
	[EMP_Type] [varchar](50) NULL,
	[VehicleOwnerName] [nvarchar](100) NULL,
	[VehicleNo] [nvarchar](50) NULL,
	[Make] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[Colour] [nvarchar](50) NULL,
	[EngineNo] [nvarchar](50) NULL,
	[ChassisNo] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[CNIC] [nvarchar](50) NULL,
	[VehicleClearanceLevel] [int] NULL,
	[VehicleClearanceStatus] [varchar](50) NULL,
	[ClearanceDate] [datetime] NULL,
	[ValidUpTo] [datetime] NULL,
	[VehicleType] [varchar](50) NULL,
	[BodyType] [varchar](50) NULL,
	[VehicleGUID] [nvarchar](100) NULL,
	[UHF_Tag_ID] [nvarchar](20) NULL,
	[UHF_Tag_ID_Long] [nvarchar](50) NULL,
	[IsStatic] [int] NULL,
 CONSTRAINT [PK_mctx_VACS] PRIMARY KEY CLUSTERED 
(
	[VACS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_VirdiUsers]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[mctx_VirdiUsers](
	[Virdi_User_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[User_ID] [int] NULL,
	[User_Type] [nvarchar](50) NULL,
	[User_Name] [nvarchar](50) NULL,
	[IsAdmin] [bit] NULL,
	[IsIdentify] [bit] NULL,
	[Auth_Type] [bit] NULL,
	[Face_Recognition] [bit] NULL,
	[IsAnd_Operation] [bit] NULL,
	[IsCardID] [bit] NULL,
	[IsCard] [bit] NULL,
	[Is_Password] [bit] NULL,
	[IsFPCard] [bit] NULL,
	[IsFingerPrint] [bit] NULL,
	[IsAccessAuthority] [bit] NULL,
	[GroupCode] [nvarchar](50) NULL,
	[Group_DateType] [nvarchar](15) NULL,
	[Group_StartDate] [nvarchar](50) NULL,
	[Group_EndDate] [nvarchar](50) NULL,
	[Virdi_Password] [nvarchar](50) NULL,
	[RFID] [nvarchar](50) NULL,
	[FPSecurity_Level] [int] NULL,
	[isHandled] [tinyint] NULL,
	[FP_image] [varchar](max) NULL,
	[IsDeleted] [tinyint] NULL,
 CONSTRAINT [PK_mctx_VirdiUsers] PRIMARY KEY CLUSTERED 
(
	[Virdi_User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_visitor]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_visitor](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CNIC] [varchar](50) NULL,
	[VISITOR_NAME] [nvarchar](max) NULL,
	[FATHER_NAME] [nvarchar](max) NULL,
	[Employee_ID] [int] NULL,
	[DOB] [nvarchar](max) NULL,
	[ADDRESS] [nvarchar](max) NULL,
	[DATE] [date] NULL,
	[TIME_IN] [nvarchar](max) NULL,
	[TIME_OUT] [nvarchar](max) NULL,
	[HOST] [nvarchar](max) NULL,
	[VEHICLE_NUMBER] [nvarchar](max) NULL,
	[TOKEN_NUMBER] [nvarchar](max) NULL,
	[DEPARTMENT] [nvarchar](max) NULL,
	[GATE_NUMBER] [int] NULL,
	[NAME] [nvarchar](max) NULL,
	[PHONE_NUMBER] [nvarchar](max) NULL,
	[RESTRICTED] [tinyint] NULL,
	[PICTURE_ID] [bigint] NULL,
	[IsHandled] [tinyint] NULL,
	[Is_deleted] [bit] NULL,
	[Client_IP] [nvarchar](max) NULL,
	[Relations] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Visit_Purpose] [nvarchar](250) NULL,
	[NewPhoto] [image] NULL,
	[UserType] [nchar](100) NULL,
	[VID] [int] NULL,
	[ValiditDate] [datetime] NULL,
	[isexpired]  AS (case when [ValiditDate]>=getdate() then (1) else (0) end),
 CONSTRAINT [PK_visitor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_visitorlog]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_visitorlog](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[VID] [int] NULL,
	[DATE] [nvarchar](100) NULL,
	[TIME_IN] [datetime] NULL,
	[TIME_OUT] [nvarchar](50) NULL,
	[HOST] [nvarchar](100) NULL,
	[Employee_ID] [int] NULL,
	[VEHICLE_NUMBER] [nvarchar](50) NULL,
	[TOKEN_NUMBER] [nvarchar](50) NULL,
	[DEPARTMENT] [nvarchar](100) NULL,
	[GATE_NUMBER] [int] NULL,
	[Gate_Lane] [int] NULL,
	[NAME] [nvarchar](100) NULL,
	[Dam_Sen_ID] [int] NULL,
	[RFID_ID] [nvarchar](50) NULL,
	[User_Type] [nvarchar](50) NULL,
	[IsHandled] [tinyint] NULL,
	[IsHandledUVSS] [tinyint] NULL,
	[Visit_Purpose] [varchar](250) NULL,
	[Client_IP] [nvarchar](50) NULL,
	[TerminalID] [int] NULL,
	[Is_Authorised] [tinyint] NULL,
	[CNIC] [nvarchar](20) NULL,
	[Remarks] [nvarchar](200) NULL,
	[IsDisplayed] [tinyint] NULL,
	[OutLaneID] [int] NULL,
	[OutRemarks] [nvarchar](200) NULL,
 CONSTRAINT [PK_mctx_visitorlog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_Wiegand_Devices]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_Wiegand_Devices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Gate_ID] [int] NULL,
	[Place_Id] [int] NULL,
	[Terminal_ID] [int] NULL,
	[DeviceID] [varchar](50) NULL,
	[wiegandID] [varchar](50) NULL,
	[DeviceName] [nvarchar](50) NULL,
	[TerminalType] [varchar](50) NULL,
	[DoorID] [int] NULL,
	[Client_Id] [int] NULL,
	[site_allowed] [int] NULL,
 CONSTRAINT [PK_mctx_Wiegand_Devices1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mctx_Wiegand_Devices_]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mctx_Wiegand_Devices_](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Gate_ID] [int] NULL,
	[Place_Id] [int] NULL,
	[Terminal_ID] [int] NULL,
	[DeviceID] [varchar](50) NULL,
	[wiegandID] [varchar](50) NULL,
	[DeviceName] [nvarchar](50) NULL,
	[TerminalType] [varchar](50) NULL,
	[DoorID] [int] NULL,
	[Client_Id] [int] NULL,
	[site_allowed] [int] NULL,
 CONSTRAINT [PK_mctx_Wiegand_Devices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Place]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Place](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[GateID] [int] NULL,
	[LocationName] [nvarchar](max) NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_host] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResidantGuest]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResidantGuest](
	[GID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [int] NULL,
	[CNIC] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[RelationType] [varchar](50) NULL,
	[Nationality] [varchar](50) NULL,
	[FatherName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[MobileNumber] [varchar](50) NULL,
	[IdentificationMark] [varchar](50) NULL,
	[SecurityClearance] [varchar](50) NULL,
	[ValidityFrom] [date] NULL,
	[ValidityTo] [date] NULL,
	[DOB] [date] NULL,
	[Age] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Occupation] [varchar](50) NULL,
	[NewPhoto] [image] NULL,
	[photo] [nvarchar](50) NULL,
	[ClearLevel] [nvarchar](50) NULL,
	[CStatus] [nvarchar](50) NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[AuthenticationType] [int] NULL,
 CONSTRAINT [PK_ResidantGuest] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResidantStatus]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResidantStatus](
	[ResidantStatus_ID] [int] IDENTITY(1,1) NOT NULL,
	[ResidantStatus_Name] [varchar](50) NULL,
 CONSTRAINT [PK_ResidantStatus] PRIMARY KEY CLUSTERED 
(
	[ResidantStatus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[RoleName] [varchar](20) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RouteTerminal]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteTerminal](
	[RTID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Terminal_ID] [int] NOT NULL,
	[Device_ID] [int] NOT NULL,
	[PlaceName] [nvarchar](100) NOT NULL,
	[Is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_RouteTerminal] PRIMARY KEY CLUSTERED 
(
	[RTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Section](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [varchar](50) NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Servant]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Servant](
	[SID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [int] NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NULL,
	[FatherName] [nvarchar](50) NULL,
	[BCnumber] [varchar](50) NULL,
	[MobileNumber] [varchar](50) NULL,
	[ClearanceLevel] [varchar](50) NULL,
	[SecurityClearance] [varchar](50) NULL,
	[ValidityFrom] [date] NULL,
	[ValidityTo] [date] NULL,
	[DOB] [date] NULL,
	[PlaceofWork] [nvarchar](255) NULL,
	[NIC] [nvarchar](255) NOT NULL,
	[MarkofIdentification] [nvarchar](255) NULL,
	[_Photo] [image] NULL,
	[Photo] [nvarchar](255) NULL,
	[created_by] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[isHandled] [tinyint] NOT NULL,
	[RFID] [nvarchar](50) NULL,
	[NewPhoto] [image] NULL,
	[Status] [varchar](50) NULL,
	[_status] [bit] NULL,
	[PerAddr] [nvarchar](50) NULL,
	[AuthenticationType] [int] NULL,
 CONSTRAINT [PK_Servant] PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_ExceptionLog]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_ExceptionLog](
	[Logid] [bigint] IDENTITY(1,1) NOT NULL,
	[ExceptionHeader] [varchar](max) NULL,
	[ExceptionType] [varchar](100) NULL,
	[ExceptionDetails] [nvarchar](max) NULL,
	[Logdate] [datetime] NULL,
 CONSTRAINT [PK_Tbl_ExceptionLoggingToDataBase] PRIMARY KEY CLUSTERED 
(
	[Logid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Finger]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Finger](
	[tblFingerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[User_Type] [varchar](50) NOT NULL,
	[User_Name] [varchar](100) NOT NULL,
	[CNIC] [nvarchar](50) NOT NULL,
	[FingerIndex] [tinyint] NOT NULL,
	[FingerData] [varbinary](1000) NOT NULL,
	[Flag] [tinyint] NOT NULL,
	[Finger_Format] [int] NOT NULL,
	[CreatedBy] [nvarchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_UVSSlog]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_UVSSlog](
	[UVSSID] [bigint] IDENTITY(1,1) NOT NULL,
	[LogDate] [date] NULL,
	[LogDateTime] [datetime] NULL,
	[CameraIP] [varchar](50) NULL,
	[Sequence] [int] NULL,
	[VehicleNumber] [varchar](50) NULL,
	[FOD] [tinyint] NULL,
	[PDI] [varchar](50) NULL,
	[Previous] [tinyint] NULL,
	[PreviousPath] [nvarchar](500) NULL,
	[IsHandled] [bit] NULL,
	[IsDisplayed] [bit] NULL,
	[Place_Id] [int] NULL,
	[RevisedDecision] [varchar](50) NULL,
	[RevisedRemarks] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUserCard]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUserCard](
	[Card_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[User_Type] [varchar](10) NOT NULL,
	[RFID] [varchar](50) NOT NULL,
	[CNIC] [varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_tblUserCard] PRIMARY KEY CLUSTERED 
(
	[Card_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[userid] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[firstname] [nvarchar](255) NULL,
	[lastname] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[mobile] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[RoleId] [int] NULL,
	[UserType] [varchar](50) NULL,
	[created_by] [bigint] NULL,
	[created_date] [datetime] NULL,
	[modified_by] [bigint] NULL,
	[modified_date] [datetime] NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usersLog]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usersLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[firstname] [nvarchar](255) NULL,
	[lastname] [nvarchar](255) NULL,
	[Divission] [nvarchar](50) NULL,
	[PNo] [nvarchar](50) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[mobile] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
	[created_by] [bigint] NULL,
	[created_date] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UVSS_FOD]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UVSS_FOD](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FOD_ID] [int] NULL,
	[FOD_Status] [varchar](20) NULL,
 CONSTRAINT [PK_FOD] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UVSS_PDI]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UVSS_PDI](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PDI_ID] [int] NULL,
	[PDI_Status] [varchar](20) NULL,
 CONSTRAINT [PK_PDI] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UVSS_Previous]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UVSS_Previous](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Previous_ID] [int] NULL,
	[Previous_Status] [varchar](30) NULL,
 CONSTRAINT [PK_Previous] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Visitor]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitor](
	[VID] [smallint] NOT NULL,
	[IssueDt] [datetime] NULL,
	[IssueTm] [datetime] NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[CardNo] [nvarchar](255) NULL,
	[Addr] [nvarchar](80) NULL,
	[NIC] [nvarchar](255) NULL,
	[Phone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](255) NULL,
	[Profession] [nvarchar](30) NULL,
	[VisitPurpose] [nvarchar](30) NULL,
	[VisitDays] [smallint] NULL,
	[ValidUpto] [datetime] NULL,
	[ReferenceName] [nvarchar](50) NULL,
	[Rank] [nvarchar](50) NULL,
	[ReferenceAdd] [nvarchar](255) NULL,
	[_Photo] [image] NULL,
	[Photo] [nvarchar](100) NULL,
	[BarCode] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[DD] [datetime] NULL,
	[PrintSelected] [bit] NULL,
	[Printed] [tinyint] NULL,
	[LastPrintDt] [datetime] NULL,
	[LastPrintTm] [datetime] NULL,
	[Relation] [nvarchar](255) NULL,
	[EID] [smallint] NULL,
	[EFID] [smallint] NULL,
	[SID] [smallint] NULL,
	[SFID] [smallint] NULL,
	[NRID] [smallint] NULL,
	[Days] [tinyint] NULL,
	[created_by] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](50) NULL,
	[modified_date] [datetime] NULL,
	[RFID] [nvarchar](50) NULL,
	[Designation_ID] [int] NULL,
	[Person_CatID] [int] NULL,
	[NewPhoto] [image] NULL,
 CONSTRAINT [PK__Visitor] PRIMARY KEY CLUSTERED 
(
	[VID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Visitor_Tbl]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Visitor_Tbl](
	[V_ID] [int] IDENTITY(1,1) NOT NULL,
	[Uniq_Code] [varchar](50) NULL,
	[Full_Name] [nvarchar](max) NULL,
	[Father_Name] [nvarchar](50) NULL,
	[CNIC] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[DoB] [varchar](50) NULL,
	[PhoneNo] [varchar](50) NULL,
	[Person_To_Visit] [varchar](50) NULL,
	[Place_To_Visit] [int] NULL,
	[Purpose_To_Visit] [varchar](100) NULL,
	[Status] [varchar](10) NULL,
	[DateofVisit] [varchar](50) NULL,
	[Company_ID] [int] NULL,
	[RFID] [varchar](20) NULL,
	[VisitorOrganization] [varchar](50) NULL,
	[Designation] [int] NULL,
	[EmpNo] [varchar](20) NULL,
	[PassportNo] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[DrivLic] [varchar](20) NULL,
	[CReg] [varchar](20) NULL,
	[Cmake] [int] NULL,
	[CVariant] [int] NULL,
	[Cmodel] [varchar](20) NULL,
	[CColor] [int] NULL,
	[VisitArea] [varchar](100) NULL,
	[TimeIn] [varchar](25) NULL,
	[TimeOut] [varchar](25) NULL,
	[EnglishName] [varchar](50) NULL,
	[AuthenticationType] [varchar](50) NULL,
	[CardExpire] [varchar](50) NULL,
	[StrStatus] [varchar](20) NULL,
	[ImageName] [nvarchar](255) NULL,
	[ImageData] [image] NULL,
	[imgSize] [image] NULL,
	[Deleted] [bit] NULL,
	[IsHandled] [bit] NULL,
	[Department] [int] NULL,
 CONSTRAINT [PK_Visitor_Tbl] PRIMARY KEY CLUSTERED 
(
	[V_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[win_TransportBodyType]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[win_TransportBodyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TransportBodyType] [varchar](50) NULL,
 CONSTRAINT [PK_win_TransportBodyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[win_TransportColour]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[win_TransportColour](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TransportColour] [varchar](50) NULL,
 CONSTRAINT [PK_win_TransportColour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[win_TransportMake]    Script Date: 13/09/2022 11:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[win_TransportMake](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TransportMake] [varchar](50) NULL,
 CONSTRAINT [PK_win_TransportMake] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[aspnet_Applications] ADD  CONSTRAINT [DF__aspnet_Ap__Appli__02C769E9]  DEFAULT (newid()) FOR [ApplicationId]
GO
ALTER TABLE [dbo].[aspnet_Membership] ADD  CONSTRAINT [DF__aspnet_Me__Passw__15DA3E5D]  DEFAULT ((0)) FOR [PasswordFormat]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  CONSTRAINT [DF__aspnet_Pa__PathI__12FDD1B2]  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  CONSTRAINT [DF__aspnet_Perso__Id__14E61A24]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[aspnet_Roles] ADD  CONSTRAINT [DF__aspnet_Ro__RoleI__13F1F5EB]  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__UserI__10216507]  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__Mobil__11158940]  DEFAULT (NULL) FOR [MobileAlias]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__IsAno__1209AD79]  DEFAULT ((0)) FOR [IsAnonymous]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee__status]  DEFAULT ((1)) FOR [_status]
GO
ALTER TABLE [dbo].[EmployeeFamily] ADD  CONSTRAINT [DF_EmployeeFamily_isHandled]  DEFAULT ((0)) FOR [isHandled]
GO
ALTER TABLE [dbo].[EmployeeFamily] ADD  CONSTRAINT [DF_EmployeeFamily__status]  DEFAULT ((0)) FOR [_status]
GO
ALTER TABLE [dbo].[mctx_ClientMachinesInfo] ADD  CONSTRAINT [DF_mctx_ClientMachinesInfo_is_deleted1]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[mctx_ClientMachinesInfo_] ADD  CONSTRAINT [DF_mctx_ClientMachinesInfo_is_deleted]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[mctx_TerminalInfos] ADD  CONSTRAINT [DF_mctx_TerminalInfos_Is_Handled1]  DEFAULT ((0)) FOR [Is_Handled]
GO
ALTER TABLE [dbo].[mctx_TerminalInfos_] ADD  CONSTRAINT [DF_mctx_TerminalInfos_Is_Handled]  DEFAULT ((0)) FOR [Is_Handled]
GO
ALTER TABLE [dbo].[mctx_VACS] ADD  CONSTRAINT [DF_mctx_VACS_VehicleClearanceLevel]  DEFAULT ((1)) FOR [VehicleClearanceLevel]
GO
ALTER TABLE [dbo].[mctx_visitor] ADD  CONSTRAINT [DF_mctx_visitor_RESTRICTED]  DEFAULT ((0)) FOR [RESTRICTED]
GO
ALTER TABLE [dbo].[mctx_visitor] ADD  CONSTRAINT [DF_mctx_visitor_IsHandled]  DEFAULT ((0)) FOR [IsHandled]
GO
ALTER TABLE [dbo].[mctx_visitorlog] ADD  CONSTRAINT [DF_mctx_visitorlog_IsDisplayed]  DEFAULT ((0)) FOR [IsDisplayed]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RouteTerminal] ADD  CONSTRAINT [DF_RouteTerminal_Is_deleted]  DEFAULT ((0)) FOR [Is_deleted]
GO
ALTER TABLE [dbo].[Servant] ADD  CONSTRAINT [DF_Servant_isHandled]  DEFAULT ((0)) FOR [isHandled]
GO
ALTER TABLE [dbo].[tbl_Finger] ADD  CONSTRAINT [DF_tbl_Finger_Flag]  DEFAULT ((0)) FOR [Flag]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Visitor_Tbl] ADD  CONSTRAINT [DF_Visitor_Tbl_IsHandled]  DEFAULT ((0)) FOR [IsHandled]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Me__Appli__1D7B6025] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[aspnet_Membership] CHECK CONSTRAINT [FK__aspnet_Me__Appli__1D7B6025]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Me__UserI__1E6F845E] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[aspnet_Membership] CHECK CONSTRAINT [FK__aspnet_Me__UserI__1E6F845E]
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Pa__Appli__17C286CF] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[aspnet_Paths] CHECK CONSTRAINT [FK__aspnet_Pa__Appli__17C286CF]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Pe__PathI__1A9EF37A] FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers] CHECK CONSTRAINT [FK__aspnet_Pe__PathI__1A9EF37A]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Pe__PathI__1B9317B3] FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] CHECK CONSTRAINT [FK__aspnet_Pe__PathI__1B9317B3]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Pe__UserI__1C873BEC] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] CHECK CONSTRAINT [FK__aspnet_Pe__UserI__1C873BEC]
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Pr__UserI__19AACF41] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[aspnet_Profile] CHECK CONSTRAINT [FK__aspnet_Pr__UserI__19AACF41]
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Ro__Appli__18B6AB08] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[aspnet_Roles] CHECK CONSTRAINT [FK__aspnet_Ro__Appli__18B6AB08]
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Us__Appli__16CE6296] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[aspnet_Users] CHECK CONSTRAINT [FK__aspnet_Us__Appli__16CE6296]
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Us__RoleI__1F63A897] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK__aspnet_Us__RoleI__1F63A897]
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Us__UserI__2057CCD0] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK__aspnet_Us__UserI__2057CCD0]
GO
ALTER TABLE [dbo].[mctx_TerminalInfos]  WITH CHECK ADD  CONSTRAINT [FK_mctx_TerminalInfos_mctx_TerminalType1] FOREIGN KEY([Terminal_Type_ID])
REFERENCES [dbo].[mctx_TerminalType] ([Terminal_Type_ID])
GO
ALTER TABLE [dbo].[mctx_TerminalInfos] CHECK CONSTRAINT [FK_mctx_TerminalInfos_mctx_TerminalType1]
GO
ALTER TABLE [dbo].[mctx_TerminalInfos_]  WITH CHECK ADD  CONSTRAINT [FK_mctx_TerminalInfos_mctx_TerminalType] FOREIGN KEY([Terminal_Type_ID])
REFERENCES [dbo].[mctx_TerminalType] ([Terminal_Type_ID])
GO
ALTER TABLE [dbo].[mctx_TerminalInfos_] CHECK CONSTRAINT [FK_mctx_TerminalInfos_mctx_TerminalType]
GO
USE [master]
GO
ALTER DATABASE [NLC_DB-16-07-2022] SET  READ_WRITE 
GO
