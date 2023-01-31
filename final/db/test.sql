--drop database SOADB
CREATE DATABASE SOADB ON PRIMARY 
	( NAME = 'SOADB', 
	FILENAME = 'E:\KienTrucHuongDichVu\Final\final\db\SOADB.mdf' , 
	SIZE = 4096KB ,
	MAXSIZE = UNLIMITED, 
	FILEGROWTH = 1024KB )
 LOG ON 
	( NAME = 'SOADB_log', 
	FILENAME = 'E:\KienTrucHuongDichVu\Final\final\db\SOADB_log.ldf' , 
	SIZE = 1024KB , 
	MAXSIZE = 2048KB , 
	FILEGROWTH = 10%)
GO

USE [SOADB]
GO

-- CREATE TABLE "alembic_version" ------------------------------
--CREATE TABLE "alembic_version"(
--	"version_num" Varchar NOT NULL PRIMARY KEY );
-- -------------------------------------------------------------


-- CREATE TABLE "brand" ----------------------------------------
CREATE TABLE "brand"(
	"id" Integer NOT NULL PRIMARY KEY,
	"name" Varchar NOT NULL,
CONSTRAINT "unique_name" UNIQUE ( "name" ) );
-- -------------------------------------------------------------



-- CREATE TABLE "category" -------------------------------------
CREATE TABLE "category"(
	"id" Integer NOT NULL PRIMARY KEY,
	"name" Varchar NOT NULL,
CONSTRAINT "unique_name_category" UNIQUE ( "name" ) );
-- -------------------------------------------------------------



-- CREATE TABLE "customer_order" -------------------------------
CREATE TABLE "customer_order"(
	"id" Integer NOT NULL PRIMARY KEY,
	"invoice" Varchar NOT NULL,
	"status" Varchar NOT NULL,
	"customer_id" Integer NOT NULL,
	"date_created" DateTime NOT NULL,
	"orders" Varchar,
CONSTRAINT "unique_invoice" UNIQUE ( "invoice" ) );
-- -------------------------------------------------------------



-- CREATE TABLE "register" -------------------------------------
CREATE TABLE "register"(
	"id" Integer NOT NULL PRIMARY KEY,
	"name" Varchar,
	"username" Varchar,
	"email" Varchar,
	"password" Varchar,
	"country" Varchar,
	"city" Varchar,
	"contact" Varchar,
	"address" Varchar,
	"zipcode" Varchar,
	"profile" Varchar,
	"date_created" DateTime NOT NULL,
CONSTRAINT "unique_username" UNIQUE ( "username" ),
CONSTRAINT "unique_email" UNIQUE ( "email" ) );
-- -------------------------------------------------------------


-- CREATE TABLE "user" -----------------------------------------
CREATE TABLE "user"(
	"id" Integer NOT NULL PRIMARY KEY,
	"name" Varchar NOT NULL,
	"username" Varchar NOT NULL,
	"email" Varchar NOT NULL,
	"password" Varchar NOT NULL,
	"profile" Varchar NOT NULL,
CONSTRAINT "unique_username_user" UNIQUE ( "username" ),
CONSTRAINT "unique_email_user" UNIQUE ( "email" ) );
-- -------------------------------------------------------------

CREATE TABLE "addproduct"(
	"id" Integer NOT NULL PRIMARY KEY,
	"name" Varchar NOT NULL,
	"price" Numeric NOT NULL,
	"discount" Integer,
	"stock" Integer NOT NULL,
	"colors" Varchar NOT NULL,
	"desc" Varchar NOT NULL,
	"pub_date" DateTime NOT NULL,
	"category_id" Integer NOT NULL,
	"brand_id" Integer NOT NULL,
	"image_1" Varchar NOT NULL,
	"image_2" Varchar NOT NULL,
	"image_3" Varchar NOT NULL,
	CONSTRAINT FK_CategoryAddproduct FOREIGN KEY (category_id) REFERENCES category(id),
	CONSTRAINT FK_BrandAddproduct FOREIGN KEY (brand_id) REFERENCES brand(id),
	CONSTRAINT FK_CustomerOrderAddproduct FOREIGN KEY (id) REFERENCES customer_order(id)
 );
-- -------------------------------------------------------------

ALTER TABLE "user"
ADD CONSTRAINT FK_RegisterUser FOREIGN KEY (id) REFERENCES register(id);

ALTER TABLE "customer_order"
ADD CONSTRAINT FK_UserCustomerOrder FOREIGN KEY (customer_id) REFERENCES "user"(id);
