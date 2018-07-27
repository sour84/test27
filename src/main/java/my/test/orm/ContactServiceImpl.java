package my.test.orm;
import my.test.entity.ContactEntity;
import my.test.intf.ContactService;
import my.test.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;


@Repository
@Transactional (value = "seaTxManager")
public class ContactServiceImpl implements ContactService {

    @Autowired
    ContactRepository contactRepository;

    public List<ContactEntity> findAll() {
        return contactRepository.findAll();
    }

    public ContactEntity save(ContactEntity contact) {
        return contactRepository.save(contact);
    }

    public void delete(Integer id) {
        contactRepository.deleteById(id);
    }

    public ContactEntity editContact(ContactEntity contact) {
        return contactRepository.saveAndFlush(contact);
    }


    public ContactEntity findOne(Integer id) {
        return contactRepository.findById(id).get();
    }
}

