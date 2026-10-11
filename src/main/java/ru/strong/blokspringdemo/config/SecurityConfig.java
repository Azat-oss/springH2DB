package ru.strong.blokspringdemo.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
@Configuration
@EnableWebSecurity

public class SecurityConfig {
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(auth -> auth
                        // 1. Разрешаем всё, что начинается с /books/ (включая /books/1, /books/2 и т.д.)
                        .requestMatchers("/books/**").permitAll()
                        // 2. Разрешаем отзывы и статику
                        .requestMatchers("/reviews/all", "/reviews/new", "/reviews/**", "/css/**").permitAll()
                        // 3. Разрешаем логин и регистрацию
                        .requestMatchers("/auth/register", "/auth/login").permitAll()
                        // 4. Всё остальное требует авторизации
                        .anyRequest().authenticated()
                )
                .formLogin(form -> form
                        .loginPage("/auth/login")
                        .loginProcessingUrl("/auth/login")
                        .defaultSuccessUrl("/books", true)
                        .failureUrl("/auth/login?error=true")
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/auth/logout")
                        .logoutSuccessUrl("/books")
                        .permitAll()
                )
                .csrf(csrf -> csrf.disable());

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    @Bean
    public CommandLineRunner generateHash(PasswordEncoder passwordEncoder) {
        return args -> {
            System.out.println("Хэш для 12345: " + passwordEncoder.encode("12345"));
        };
    }

}

