﻿BEGIN TRANSACTION;
GO

ALTER TABLE [TB_USUARIOS] ADD [ProjetoId] int NULL;
GO

UPDATE [TB_USUARIOS] SET [DataAcesso] = '2024-06-20T23:29:13.5012764-03:00', [PasswordHash] = 0x1D283404DE998BE9E4EE1D981019779C49AA38F19C6EE1EA1A11F428FB1381D2B428AAFD5A30D56D88A6D6533B7175FBB0C10B0036D76872F6A5A6FAB0572FF3, [PasswordSalt] = 0x65FA935D8DDCE5F9C5A8C8522082F66E9AF73A8B38DF8E7D8224EDA54DECA866930FD78BD114FD5C191C4726C9413991963C3A3568F082075FE65E1432A56DB95DFD9040162A17231215E2209EA9ADE6E834985A26623E595234F28D02612B2649FE9A20FEC08CAF4E1489D5184E76C02D70725EE951CC03403335A767B283C4, [ProjetoId] = NULL
WHERE [Id] = 1;
SELECT @@ROWCOUNT;

GO

CREATE INDEX [IX_TB_USUARIOS_ProjetoId] ON [TB_USUARIOS] ([ProjetoId]);
GO

ALTER TABLE [TB_USUARIOS] ADD CONSTRAINT [FK_TB_USUARIOS_TB_PROJETOS_ProjetoId] FOREIGN KEY ([ProjetoId]) REFERENCES [TB_PROJETOS] ([Id]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20240621022913_ListaColaborador', N'8.0.6');
GO

COMMIT;
GO
