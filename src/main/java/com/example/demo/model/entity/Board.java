package com.example.demo.model.entity;

import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Builder
@Accessors(chain = true)
@Getter
@Setter
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Table(name="BOARD")
public class Board{
    @Id
    Long id;
    String title;
    String author;
    String filePath;
    String contents;
    Date boardedAt;
    Date updatedAt;
}
