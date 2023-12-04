package dao;

import java.util.List;

import entities.Hotel;
import jakarta.ejb.Remote;

@Remote
public interface IDaoRemote2 <T> {
	
	public T create(T o);
	public boolean delete(T o);
	public T update(T o);
	public T findById(int id);
	public List<T> findAll();
	public List<T> findByVille(int villeId);
}
