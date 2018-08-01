package my.test.intf;

import my.test.entity.ContactEntity;

import java.util.List;

public interface ContactService {


    List<ContactEntity> findByLastName(String lastName);
    List<ContactEntity> findAll();
    ContactEntity save(ContactEntity contact);
    ContactEntity delete(Integer id);
    ContactEntity findById(int id);
}
