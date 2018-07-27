package my.test.intf;

import my.test.entity.ContactEntity;

import java.util.List;

public interface ContactService {
    List<ContactEntity> findAll();
    ContactEntity save(ContactEntity contact);
    void delete(Integer id);
    ContactEntity editContact(ContactEntity contact);

    ContactEntity findOne(Integer id);
}
