package com.nt.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "users")
@Data
public class User {

    @Id
    private String username;

    private String password;

    private boolean enabled = true;
}
