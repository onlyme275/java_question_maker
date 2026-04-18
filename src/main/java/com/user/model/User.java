package com.user.model;

// User model class represents a user entity (table in database)
public class User {

    // Instance variables (fields) for User
    private int id;          // Unique ID of the user
    private String username;     // Name of the user
    private int age;
    private String address;
    private String email;   // Email address of the user
    private String password; // Password of the user
    private int is_staff=0; // Flag to indicate if user is an admin



    // Default constructor (no-argument constructor)
    // Used when creating empty object and setting values later
    public User(){}

    // Parameterized constructor
    // Used to create object with all values at once
    public User(int id, String username, int age, String address, String email, String password) {
        this.id = id;
        this.username = username;
        this.age = age;
        this.address = address;
        this.email = email;
        this.password = password;
    }

    // Getter method for id
    public int getId() {
        return id;
    }

    // Setter method for id
    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    public int getAge() {
        return age;
    }
    public void setAge(int age){
        this.age=age;
    }
    public int getIs_staff() {
    return is_staff;
    }

    public void setIs_staff(int is_staff) {
        this.is_staff = is_staff;
    }

    // Getter method for email
    public String getEmail() {
        return email;
    }
    public String getAddress() {
        return address;
    }

    public void setAddress(String address){
        this.address=address;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

