package com.nt.srvice;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.nt.entity.Authorities;
import com.nt.entity.User;
import com.nt.repository.AuthoritiesRepository;
import com.nt.repository.UserRepository;

@Service
public class UserRegistrationService {

    private final UserRepository userRepo;
    private final AuthoritiesRepository authRepo;
    private final PasswordEncoder encoder;

    public UserRegistrationService(UserRepository userRepo, AuthoritiesRepository authRepo, PasswordEncoder encoder) {
        this.userRepo = userRepo;
        this.authRepo = authRepo;
        this.encoder = encoder;
    }

    public void registerUser(String username, String password, String role) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(encoder.encode(password));
        user.setEnabled(true);

        userRepo.save(user);

        Authorities auth = new Authorities();
        auth.setUsername(username);
        auth.setAuthority(role);

        authRepo.save(auth);
    }
}