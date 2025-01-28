package udistrital.module.bd.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import udistrital.module.bd._PROFILE.Perfil;
import udistrital.module.bd.annotation.RequiredProfile;
import udistrital.module.bd.dto.LoginDTO;
import udistrital.module.bd.service.login.LoginService;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class LoginController {

    private final LoginService service;
    private final Perfil perfilGeneral;


    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginDTO login) {
        System.out.println("El usuario: xd : "+login);
        Perfil pfl = service.login(login.getNombre());
        if (pfl == null) {
            return ResponseEntity.badRequest().body("Usuario no encontrado");
        }
        perfilGeneral.setApellido(pfl.getApellido());
        perfilGeneral.setCelular(pfl.getCelular());
        perfilGeneral.setCorreoContacto(pfl.getCorreoContacto());
        perfilGeneral.setNombre(pfl.getNombre());
        perfilGeneral.setUsuario(pfl.getUsuario());
        return ResponseEntity.ok().body(pfl);
    }


    @PostMapping("/logout")
    @RequiredProfile
    public ResponseEntity<?> logout() {
        perfilGeneral.setUsuario(null);
        perfilGeneral.setNombre(null);
        perfilGeneral.setApellido(null);
        perfilGeneral.setCelular(null);
        perfilGeneral.setCorreoContacto(null);
        return ResponseEntity.ok("Sesión cerrada exitosamente");
    }
}
